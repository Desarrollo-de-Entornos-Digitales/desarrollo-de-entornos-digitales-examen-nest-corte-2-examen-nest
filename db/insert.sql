-- Insert Roles
INSERT INTO roles (name, description) VALUES
('admin', 'Administrator with full access'),
('user', 'Regular user with limited access');

-- Insert Permissions
INSERT INTO permissions (name, description) VALUES
('create', 'Create new resources'),
('read', 'Read resources'),
('update', 'Update existing resources'),
('delete', 'Delete resources'),
('manage_users', 'Manage user accounts'),
('manage_roles', 'Manage roles and permissions'),
('create_event', 'Create events'),
('read_event', 'Read events'),
('update_event', 'Update events'),
('deactivate_event', 'Deactivate events'),
('delete_event', 'Delete events'),
('create_reservation', 'Create reservations'),
('read_reservation', 'Read reservations'),
('read_own_reservation', 'Read own reservations'),
('update_reservation', 'Update reservations'),
('cancel_reservation', 'Cancel reservations'),
('delete_reservation', 'Delete reservations');

-- Insert Role-Permission relationships
INSERT INTO role_permissions (role_id, permission_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6),
(1, 7), (1, 8), (1, 9), (1, 10), (1, 11),
(1, 12), (1, 13), (1, 14), (1, 15), (1, 16), (1, 17), -- Admin has all permissions
(2, 2), (2, 1),
(2, 8),
(2, 12), (2, 14), (2, 16); -- User can read events, create/read own/cancel reservations

-- Insert Users
INSERT INTO users (username, email, password_hash, bio, role_id, created_at) VALUES
('admin_user', 'admin@example.com', '$2b$10$inl.oviLKU/8nelnHKqiH.WwMt4bDA/EcWwQRY1t2oAgxyDT8tyFS', 'Administrator account', 1, NOW()),
('juan_perez', 'juan@example.com', '$2b$10$inl.oviLKU/8nelnHKqiH.WwMt4bDA/EcWwQRY1t2oAgxyDT8tyFS', 'Lover of board games', 2, NOW()),
('maria_garcia', 'maria@example.com', '$2b$10$inl.oviLKU/8nelnHKqiH.WwMt4bDA/EcWwQRY1t2oAgxyDT8tyFS', 'Strategic games enthusiast', 2, NOW()),
('carlos_lopez', 'carlos@example.com', '$2b$10$inl.oviLKU/8nelnHKqiH.WwMt4bDA/EcWwQRY1t2oAgxyDT8tyFS', 'Party games fan', 2, NOW()),
('ana_martinez', 'ana@example.com', '$2b$10$inl.oviLKU/8nelnHKqiH.WwMt4bDA/EcWwQRY1t2oAgxyDT8tyFS', 'Competitive player', 2, NOW()),
('luis_fernandez', 'luis@example.com', '$2b$10$inl.oviLKU/8nelnHKqiH.WwMt4bDA/EcWwQRY1t2oAgxyDT8tyFS', 'Game collector', 2, NOW());

-- Insert Events
-- available_spots already considers ACTIVE reservations inserted below
INSERT INTO events (title, date, capacity, available_spots, is_active) VALUES
('Modern Web Architecture Workshop', NOW() + INTERVAL '7 days', 30, 25, TRUE),
('Board Games Night', NOW() + INTERVAL '10 days', 20, 14, TRUE),
('NestJS API Design Masterclass', NOW() + INTERVAL '15 days', 25, 21, TRUE),
('Frontend Accessibility Bootcamp', NOW() + INTERVAL '20 days', 15, 15, TRUE),
('Legacy Monolith Migration Talk', NOW() + INTERVAL '30 days', 40, 40, FALSE);

-- Insert Reservations
INSERT INTO reservations (user_id, event_id, quantity, status, created_at) VALUES
(2, 1, 3, 'ACTIVE', NOW() - INTERVAL '1 day'),
(3, 1, 2, 'ACTIVE', NOW() - INTERVAL '12 hours'),
(4, 2, 4, 'ACTIVE', NOW() - INTERVAL '2 days'),
(5, 2, 2, 'ACTIVE', NOW() - INTERVAL '18 hours'),
(6, 3, 3, 'ACTIVE', NOW() - INTERVAL '8 hours'),
(3, 2, 1, 'CANCELLED', NOW() - INTERVAL '3 days'),
(2, 3, 1, 'ACTIVE', NOW() - INTERVAL '6 hours');