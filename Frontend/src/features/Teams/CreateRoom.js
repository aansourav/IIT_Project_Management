import React, { useState } from 'react';
import SelectBox from '../../components/Input/SelectBox';
import CommonTitleCard from '../../components/Cards/CommonTitleCard';
import axios from 'axios';
import { useDispatch } from 'react-redux';
import { openModal } from '../common/modalSlice';
import { MODAL_BODY_TYPES } from '../../utils/globalConstantUtil';
import { useEffect } from 'react';
import RoomTable from './RoomTable';
import RoomSelectionSelectBox from './Utilities/RoomSelectionSelectBox';

const CreateRoom = () => {
    const [rooms,setRooms]=useState([])
    const [currentRoom,setCurrentRoom]=useState(null)
    const dispatch = useDispatch()

    useEffect(() => {
        const fetchRoomsData = async () => {
            try {
                const response = await axios.get('http://127.0.0.1:5000/api/getRooms');
                const { rooms} = response.data
                setRooms(rooms)
            } catch (error) {
                // Handle error
                console.error(error);
            }
        };
        fetchRoomsData();
    }, [currentRoom]);

    const deleteRoom = async (room_id) => {
        try {
          const response = await axios.delete(`http://127.0.0.1:5000/api/deleteRoom/${room_id}`);
         
          // Perform any additional actions after successful deletion
          const {error,message,rowsAffected}= response.data; // Return the response data
          if(!error){
            setCurrentRoom(rowsAffected.roomDeleted)
            dispatch(openModal({title : "Success", bodyType : MODAL_BODY_TYPES.LEAD_ADD_NEW,error:false,errormsg:message}))
          }

        } catch (error) {
          console.error('Error deleting room:', error);
        
        }
      };


    const handleFormSubmit=async (course,batch)=>{
        let response;
        try {
          
              response = await axios.post('http://127.0.0.1:5000/api/create_room', {
                batch_no:batch,
                 course_type:course
              }, {
                  headers: {
                    'Content-Type': 'application/json'
                  }
              });
              const { error,message, roomId } = response.data
              if(!error){
                setCurrentRoom(roomId)
                // setRoomCreated(true)
                // setRoomId(roomId)
                dispatch(openModal({title : "Success", bodyType : MODAL_BODY_TYPES.LEAD_ADD_NEW,error:false,errormsg:message}))
              }
        } catch (error) {
            console.error(error);
         
        }
    }
    return (
        <>
            <CommonTitleCard title="Create Room">
              <RoomSelectionSelectBox handleFormSubmit={handleFormSubmit}></RoomSelectionSelectBox>
            </CommonTitleCard>
            <CommonTitleCard title="Rooms">
              <RoomTable rooms={rooms} deleteRoom={deleteRoom}></RoomTable>
            </CommonTitleCard>





        </>
    );
};

export default CreateRoom;