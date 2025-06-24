namespace PaseoExpressWebApp.Models
{
    /// <summary>
    /// Clase genérica que representa el resultado de una operación de autenticación.
    /// Puede contener información sobre el éxito o fracaso de la operación, mensajes de error y datos asociados.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    
    public class AuthResult<T>
    {
        // Indica si la operación fue exitosa o no.
        public bool Success { get; set; }

        // Contiene el mensaje de error si la operación falló.
        public string ErrorMessage { get; set; }

        // Especifica el tipo de error que ocurrió (por ejemplo: "UserNotFound", "ServerError").
        public string ErrorType { get; set; }

        // Contiene los datos asociados al resultado exitoso (por ejemplo, un token o el usuario autenticado).
        public T Data { get; set; }

        /// <summary>
        /// Método estático que representa un error cuando el usuario no fue encontrado.
        /// </summary>
        /// <param name="message">El mensaje de error a mostrar</param>
        /// <returns></returns>
        public static AuthResult<T> UserNotFound(string message = "Usuario o contraseña incorrectos")
        {
            return new AuthResult<T>
            {
                Success = false,
                ErrorMessage = message,
                ErrorType = "UserNotFound"
            };
        }

        /// <summary>
        /// Método estático que representa un error interno del servidor.
        /// </summary>
        /// <param name="message">El mensaje de error a mostrar.</param>
        /// <returns></returns>
        public static AuthResult<T> ServerError(string message = "Error interno del servidor")
        {
            return new AuthResult<T>
            {
                Success = false,
                ErrorMessage = message,
                ErrorType = "ServerError"
            };
        }
        
        /// <summary>
        /// Método estático que representa un resultado exitoso.
        /// </summary>
        /// <param name="data">Recibe los datos que se quieren retornar como resultado.</param>
        /// <returns></returns>
        public static AuthResult<T> Ok(T data)
        {
            return new AuthResult<T>
            {
                Success = true,
                Data = data
            };
        }

        /// <summary>
        /// Método estático que permite crear un error personalizado.
        /// </summary>
        /// <param name="errorType">Especifica el tipo de error</param>
        /// <param name="message">Método estático que representa un error cuando el usuario no fue encontrado.</param>
        /// <returns></returns>
        public static AuthResult<T> Error(string errorType, string message)
        {
            return new AuthResult<T>
            {
                Success = false,
                ErrorMessage = message,
                ErrorType = errorType
            };
        }
    }

}
