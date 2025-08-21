/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javaClasses;

/**
 *
 * @author Nusrath
 */


import jakarta.servlet.http.HttpSession;


public class SessionManager {

    public static void setUserSession(HttpSession session, String username, String role) {
        session.setAttribute("username", username);
        session.setAttribute("role", role);
    }

    public static String getUsername(HttpSession session) {
        return (String) session.getAttribute("username");
    }

    public static String getRole(HttpSession session) {
        return (String) session.getAttribute("role");
    }

    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("username") != null;
    }

    public static void logout(HttpSession session) {
        session.invalidate();
    }
}
