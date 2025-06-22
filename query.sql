-- name: GetUser :one
SELECT * FROM users
WHERE id = $1 LIMIT 1;

-- name: DeleteUser :exec
DELETE FROM users
WHERE id = $1;

-- name: CreateUser :exec
INSERT INTO users (id, name)
VALUES ($1, $2)
RETURNING id;

-- name: UpdateUser :exec
UPDATE users
SET name = $2
WHERE id = $1;

-- name: CreateTodo :exec
INSERT INTO todos (id, title, description, done, user_id)
VALUES ($1, $2, $3, $4, $5);
-- name: GetTodosFromUser :many
SELECT * FROM todos
WHERE user_id = $1
ORDER BY done, title;
-- name: UpdateTodo :exec
UPDATE todos
SET title = $2, description = $3, done = $4
WHERE id = $1;
-- name: DeleteTodosFromUser :exec
DELETE FROM todos
WHERE user_id = $1;