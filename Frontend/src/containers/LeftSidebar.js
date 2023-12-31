import { Link, NavLink, useLocation } from "react-router-dom";
import routes from "../routes/sidebar";
import SidebarSubmenu from "./SidebarSubmenu";

function LeftSidebar() {
  const location = useLocation();
  const type = localStorage.getItem("type");

  return (
    <div className="drawer-side ">
      <label htmlFor="left-sidebar-drawer" className="drawer-overlay"></label>
      <ul className="menu  pt-2 w-80 bg-base-100 text-base-content">
        <li className="mb-2 font-semibold text-xl">
          <Link to={"/app/welcome"}>
            <img className="mask mask-squircle w-20" src="/Job_Quest-logo.png" alt="DashWind Logo" />
            SPL Management System
          </Link>{" "}
        </li>
        {routes[type - 1].map((route, k) => {
          return (
            <li className="" key={k}>
              {route.submenu ? (
                <SidebarSubmenu {...route} />
              ) : (
                <NavLink
                  end
                  to={route.path}
                  className={({ isActive }) => `${isActive ? "font-semibold  bg-base-200 " : "font-normal"}`}
                >
                  {route.icon} {route.name}
                  {location.pathname === route.path ? (
                    <span
                      className="absolute inset-y-0 left-0 w-1 rounded-tr-md rounded-br-md bg-primary "
                      aria-hidden="true"
                    ></span>
                  ) : null}
                </NavLink>
              )}
            </li>
          );
        })}
      </ul>
    </div>
  );
}

export default LeftSidebar;
