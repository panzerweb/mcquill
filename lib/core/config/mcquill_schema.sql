-- THIS FILE IS FOR DESIGN ONLY AND IS PRIMARILY USED FOR LAYOUT AND OUTLINING RATHER THAN IMPLEMENTATION

-- ============================================================
-- Minecraft Planner Database Schema
-- Version: 1.0
-- Description:
-- Local SQLite database for managing Minecraft worlds,
-- tasks, and tags.
-- ============================================================

-- ============================================================
-- WORLDS
-- Stores every Minecraft world created by the user.
-- ============================================================

CREATE TABLE worlds (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    name TEXT NOT NULL,
    description TEXT,

    category_id INTEGER NOT NULL,

    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL

    FOREIGN KEY (category_id)
        REFERENCES category(id)
);

-- ============================================================
-- CATEGORY
-- Stores every category for Minecraft worlds such as (Survival, Creative, Hardcore, Redstone)
-- ============================================================
CREATE TABLE category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    name TEXT NOT NULL UNIQUE,
    icon TEXT NOT NULL,
    color TEXT NOT NULL,
);

-- ============================================================
-- TASKS
-- Stores all tasks belonging to a Minecraft world.
-- ============================================================

CREATE TABLE tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    world_id INTEGER NOT NULL,

    title TEXT NOT NULL,
    description TEXT,
    purpose TEXT,

    priority TEXT NOT NULL DEFAULT 'MEDIUM'
    CHECK (priority IN ('LOW', 'MEDIUM', 'HIGH')),

    status TEXT NOT NULL DEFAULT 'TODO'
    CHECK (status IN ('TODO', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED')),

    due_date DATETIME,
    completed_at DATETIME,

    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,

    FOREIGN KEY (world_id)
        REFERENCES worlds(id)
        ON DELETE CASCADE
);



-- ============================================================
-- TAGS
-- Stores reusable tags that can be attached to tasks.
-- ============================================================

CREATE TABLE tags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    name TEXT NOT NULL UNIQUE,
);



-- ============================================================
-- TASK_TAGS
-- Many-to-Many relationship between Tasks and Tags.
-- ============================================================

CREATE TABLE task_tags (
    task_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,

    PRIMARY KEY (task_id, tag_id),

    FOREIGN KEY (task_id)
        REFERENCES tasks(id)
        ON DELETE CASCADE,

    FOREIGN KEY (tag_id)
        REFERENCES tags(id)
        ON DELETE CASCADE
);