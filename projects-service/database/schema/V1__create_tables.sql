CREATE TABLE IF NOT EXISTS projects (
    id VARCHAR(30) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL DEFAULT '',

    status VARCHAR(30) NOT NULL
        CHECK (status IN ('Planned', 'Active', 'On Hold', 'Completed', 'Cancelled')),

    priority VARCHAR(20) NOT NULL
        CHECK (priority IN ('Low', 'Medium', 'High', 'Critical')),

    project_type VARCHAR(80) NOT NULL,
    client VARCHAR(150) NOT NULL,
    department VARCHAR(100) NOT NULL,
    manager VARCHAR(160) NOT NULL,

    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    funding NUMERIC(14,2) CHECK (funding >= 0),

    -- UTC
    created_at TIMESTAMP NOT NULL DEFAULT (now() AT TIME ZONE 'UTC'),
    updated_at TIMESTAMP NOT NULL DEFAULT (now() AT TIME ZONE 'UTC'),

    -- For Similar Project Detection
    tags TEXT[] NOT NULL DEFAULT '{}',

    CONSTRAINT valid_project_dates CHECK (end_date >= start_date)
);

CREATE INDEX IF NOT EXISTS idx_projects_id ON projects(id);
CREATE INDEX IF NOT EXISTS idx_projects_status ON projects(status);
CREATE INDEX IF NOT EXISTS idx_projects_tags ON projects(tags);
CREATE INDEX IF NOT EXISTS idx_projects_start_date ON projects(start_date);

CREATE TABLE IF NOT EXISTS project_researchers (
    project_id VARCHAR(30) NOT NULL REFERENCES projects(id) ON DELETE CASCADE,

    researcher_id INTEGER NOT NULL,

    assigned_at TIMESTAMP NOT NULL DEFAULT (now() AT TIME ZONE 'UTC'),

    PRIMARY KEY (project_id, researcher_id)
);

CREATE INDEX idx_project_researchers_researcher ON project_researchers(researcher_id);
