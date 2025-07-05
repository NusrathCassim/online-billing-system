<%-- 
    Document   : login
    Created on : Jul 5, 2025, 10:18:43 PM
    Author     : Nusrath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Fredoka', sans-serif;
      background-color: #f9f6f2;
      color: #222;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 2rem;
    }

    .login-card {
      background: #fff;
      padding: 2.5rem 2rem;
      border-radius: 1.5rem;
      max-width: 420px;
      width: 100%;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    .login-card h2 {
      font-family: 'Patrick Hand', cursive;
      font-size: 2rem;
      margin-bottom: 2rem;
      color: #222;
    }

    .login-card form {
      display: flex;
      flex-direction: column;
      gap: 1.2rem;
      font-family: 'Fredoka', sans-serif;
    }

    .login-card label {
      font-weight: bold;
      font-size: 1rem;
      text-align: left;
      color: #333;
    }

    .login-card input {
      padding: 0.9rem 1rem;
      border: 1px solid #ddd;
      border-radius: 10px;
      font-size: 1rem;
      transition: border 0.3s ease;
      background-color: #fefefe;
    }

    .login-card input:focus {
      border-color: #ffcc00;
      outline: none;
    }

    .cta-btn {
      background: #ffcc00;
      border: none;
      padding: 0.9rem;
      font-weight: bold;
      font-size: 1rem;
      cursor: pointer;
      border-radius: 10px;
      box-shadow: 3px 3px 0 #000;
      transition: transform 0.2s ease;
    }

    .cta-btn:hover {
      transform: translateY(-2px);
    }

    .login-note {
      margin-top: 1.5rem;
      font-size: 0.85rem;
      color: #666;
      font-family: 'Patrick Hand', cursive;
    }
  </style>
    </head>
    <body>
        <section class="login-section">
            <div class="login-card">
              <h2>Staff Login</h2>
              <form action="LoginServlet" method="POST">
                
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required />

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required />

                <button type="submit" class="cta-btn">Login</button>
              </form>
              <p class="login-note">Access is restricted to authorized employees of Pahana Edu.</p>
            </div>
          </section>

    </body>
</html>
