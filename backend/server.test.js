const request = require("supertest");
const app = require("./server");

describe("Pruebas de la API de Comida Rápida", () => {

    test("El endpoint /api/health debería devolver status 200 y mensaje ok", async () => {
        const response = await request(app).get("/api/health");

        expect(response.statusCode).toBe(200);

        expect(response.body).toHaveProperty("status", "ok");
        expect(response.body).toHaveProperty("message", "Backend de tienda de comida en ejecucion");
    });

    test("Debería rechazar un producto sin datos (Validación POST)", async () => {
        const response = await request(app).post("/api/productos").send({});

        expect(response.statusCode).toBe(400);
        expect(response.body).toHaveProperty("message", "Nombre, precio y stock son obligatorios.");
    });

});