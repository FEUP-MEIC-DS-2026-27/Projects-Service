-- The same 75 projects as Search-Service's mock data, flattened to the API's shape.
INSERT INTO projects
    (id, title, description, status, priority, project_type, client, department, manager, start_date, end_date, funding,
     tags, created_at, updated_at)
VALUES
    ('INE-25-0001', 'Renewable Energy Integration - Porto #01', 'Mock project for engineering activities in Porto. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'Low', 'Engineering', 'Northstar Industrial Systems', 'Engineering', 'Miguel Costa', '2025-01-01', '2025-03-09', 40695.36, ARRAY['renewable-energy-integration', 'porto', 'engineering', 'northstar-industrial-systems'], '2025-01-02 09:00:00', '2026-09-30 12:00:00'),
    ('INE-25-0002', 'Industrial Automation Upgrade - Lisbon #02', 'Mock project for energy activities in Lisbon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'Energy', 'Digital Enterprise Partners', 'Research and Development', 'Ana Silva', '2025-01-06', '2025-03-21', 57988.54, ARRAY['industrial-automation-upgrade', 'lisbon', 'energy', 'research-and-development', 'digital-enterprise-partners'], '2025-01-03 09:00:00', '2026-09-29 12:00:00'),
    ('INE-25-0003', 'Smart Infrastructure Development - Braga #03', 'Mock project for it activities in Braga. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'IT', 'European Smart Cities', 'Information Technology', 'Rui Carvalho', '2025-01-11', '2025-04-02', 75629.54, ARRAY['smart-infrastructure-development', 'braga', 'it', 'information-technology', 'european-smart-cities'], '2025-01-04 09:00:00', '2026-09-28 12:00:00'),
    ('INE-25-0004', 'Digital Transformation Initiative - Coimbra #04', 'Mock project for research activities in Coimbra. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'Research', 'Continental Transport Systems', 'Project Management', 'Ines Rodrigues', '2025-01-16', '2025-04-14', 93618.36, ARRAY['digital-transformation-initiative', 'coimbra', 'research', 'project-management', 'continental-transport-systems'], '2025-01-05 09:00:00', '2026-09-27 12:00:00'),
    ('INE-25-0005', 'Environmental Monitoring System - Aveiro #05', 'Mock project for infrastructure activities in Aveiro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'High', 'Infrastructure', 'TerraNova Environmental', 'Operations', 'Andre Correia', '2025-01-21', '2025-04-26', 111955.00, ARRAY['environmental-monitoring-system', 'aveiro', 'infrastructure', 'operations', 'terranova-environmental'], '2025-01-06 09:00:00', '2026-09-26 12:00:00'),
    ('INE-25-0006', 'Electrical Network Modernization - Faro #06', 'Mock project for environmental activities in Faro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Critical', 'Environmental', 'FutureGrid Renewables', 'Energy Systems', 'Joao Ferreira', '2025-01-26', '2025-05-08', 130639.46, ARRAY['electrical-network-modernization', 'faro', 'environmental', 'energy-systems', 'futuregrid-renewables'], '2025-01-07 09:00:00', '2026-09-25 12:00:00'),
    ('INE-25-0007', 'Water Management Optimization - Madrid #07', 'Mock project for industrial activities in Madrid. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Low', 'Industrial', 'Global Industrial Consulting', 'Infrastructure', 'Carolina Nunes', '2025-01-31', '2025-05-20', 149671.74, ARRAY['water-management-optimization', 'madrid', 'industrial', 'infrastructure', 'global-industrial-consulting'], '2025-01-08 09:00:00', '2026-09-24 12:00:00'),
    ('INE-25-0008', 'Advanced Manufacturing System - Barcelona #08', 'Mock project for consulting activities in Barcelona. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'Medium', 'Consulting', 'Atlantic Energy Solutions', 'Environmental Services', 'Sofia Martins', '2025-02-05', '2025-06-01', 169051.84, ARRAY['advanced-manufacturing-system', 'barcelona', 'consulting', 'environmental-services', 'atlantic-energy-solutions'], '2025-01-09 09:00:00', '2026-09-23 12:00:00'),
    ('INE-25-0009', 'Energy Efficiency Improvement - Valencia #09', 'Mock project for engineering activities in Valencia. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'Medium', 'Engineering', 'Iberian Infrastructure Group', 'Engineering', 'Leonor Fernandes', '2025-02-10', '2025-06-13', 188779.76, ARRAY['energy-efficiency-improvement', 'valencia', 'engineering', 'iberian-infrastructure-group'], '2025-01-10 09:00:00', '2026-09-22 12:00:00'),
    ('INE-25-0010', 'Predictive Maintenance Platform - Bilbao #10', 'Mock project for energy activities in Bilbao. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'Energy', 'Iberia Manufacturing Group', 'Research and Development', 'Diogo Gomes', '2025-02-15', '2025-06-25', 208855.50, ARRAY['predictive-maintenance-platform', 'bilbao', 'energy', 'research-and-development', 'iberia-manufacturing-group'], '2025-01-11 09:00:00', '2026-09-21 12:00:00'),
    ('INE-25-0011', 'Smart Building Implementation - Dublin #11', 'Mock project for it activities in Dublin. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'IT', 'Urban Development Alliance', 'Information Technology', 'Beatriz Santos', '2025-02-20', '2025-07-07', 205485.95, ARRAY['smart-building-implementation', 'dublin', 'it', 'information-technology', 'urban-development-alliance'], '2025-01-12 09:00:00', '2026-09-20 12:00:00'),
    ('INE-25-0012', 'Research Laboratory Development - Rotterdam #12', 'Mock project for research activities in Rotterdam. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Critical', 'Research', 'Solaris Energy Group', 'Project Management', 'Goncalo Mendes', '2025-02-25', '2025-07-19', 224344.32, ARRAY['research-laboratory-development', 'rotterdam', 'research', 'project-management', 'solaris-energy-group'], '2025-01-13 09:00:00', '2026-09-19 12:00:00'),
    ('INE-25-0013', 'Solar Power Installation - Hamburg #13', 'Mock project for infrastructure activities in Hamburg. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'Low', 'Infrastructure', 'Alpine Water Management', 'Operations', 'Matilde Ribeiro', '2025-03-02', '2025-07-31', 243550.51, ARRAY['solar-power-installation', 'hamburg', 'infrastructure', 'operations', 'alpine-water-management'], '2025-01-14 09:00:00', '2026-09-18 12:00:00'),
    ('INE-25-0014', 'Wind Energy Feasibility Study - Lyon #14', 'Mock project for environmental activities in Lyon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Medium', 'Environmental', 'Green Horizon Technologies', 'Energy Systems', 'Daniel Teixeira', '2025-03-07', '2025-08-12', 263104.52, ARRAY['wind-energy-feasibility-study', 'lyon', 'environmental', 'energy-systems', 'green-horizon-technologies'], '2025-01-15 09:00:00', '2026-09-17 12:00:00'),
    ('INE-25-0015', 'Industrial IoT Implementation - Brussels #15', 'Mock project for industrial activities in Brussels. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Medium', 'Industrial', 'BlueWave Marine Engineering', 'Infrastructure', 'Catarina Sousa', '2025-03-12', '2025-08-24', 283006.35, ARRAY['industrial-iot-implementation', 'brussels', 'industrial', 'infrastructure', 'bluewave-marine-engineering'], '2025-01-16 09:00:00', '2026-09-16 12:00:00'),
    ('INE-25-0016', 'Renewable Energy Integration - Porto #16', 'Mock project for consulting activities in Porto. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'High', 'Consulting', 'Northstar Industrial Systems', 'Environmental Services', 'Marta Moreira', '2025-03-17', '2025-09-05', 303256.00, ARRAY['renewable-energy-integration', 'porto', 'consulting', 'environmental-services', 'northstar-industrial-systems'], '2025-01-17 09:00:00', '2026-09-15 12:00:00'),
    ('INE-25-0017', 'Industrial Automation Upgrade - Lisbon #17', 'Mock project for engineering activities in Lisbon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'High', 'Engineering', 'Digital Enterprise Partners', 'Engineering', 'Mariana Pereira', '2025-03-22', '2025-09-17', 323853.47, ARRAY['industrial-automation-upgrade', 'lisbon', 'engineering', 'digital-enterprise-partners'], '2025-01-18 09:00:00', '2026-09-14 12:00:00'),
    ('INE-25-0018', 'Smart Infrastructure Development - Braga #18', 'Mock project for energy activities in Braga. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Critical', 'Energy', 'European Smart Cities', 'Research and Development', 'Francisco Lopes', '2025-03-27', '2025-09-29', 344798.76, ARRAY['smart-infrastructure-development', 'braga', 'energy', 'research-and-development', 'european-smart-cities'], '2025-01-19 09:00:00', '2026-09-13 12:00:00'),
    ('INE-25-0019', 'Digital Transformation Initiative - Coimbra #19', 'Mock project for it activities in Coimbra. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Low', 'IT', 'Continental Transport Systems', 'Information Technology', 'Tiago Oliveira', '2025-04-01', '2025-10-11', 366091.87, ARRAY['digital-transformation-initiative', 'coimbra', 'it', 'information-technology', 'continental-transport-systems'], '2025-01-20 09:00:00', '2026-09-12 12:00:00'),
    ('INE-25-0020', 'Environmental Monitoring System - Aveiro #20', 'Mock project for research activities in Aveiro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'Research', 'TerraNova Environmental', 'Project Management', 'Pedro Almeida', '2025-04-06', '2025-10-23', 387732.80, ARRAY['environmental-monitoring-system', 'aveiro', 'research', 'project-management', 'terranova-environmental'], '2025-01-21 09:00:00', '2026-09-11 12:00:00'),
    ('INE-25-0021', 'Electrical Network Modernization - Faro #21', 'Mock project for infrastructure activities in Faro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'Medium', 'Infrastructure', 'FutureGrid Renewables', 'Operations', 'Miguel Costa', '2025-04-11', '2025-11-04', 409721.55, ARRAY['electrical-network-modernization', 'faro', 'infrastructure', 'operations', 'futuregrid-renewables'], '2025-01-22 09:00:00', '2026-09-10 12:00:00'),
    ('INE-25-0022', 'Water Management Optimization - Madrid #22', 'Mock project for environmental activities in Madrid. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'High', 'Environmental', 'Global Industrial Consulting', 'Energy Systems', 'Ana Silva', '2025-04-16', '2025-11-16', 387221.90, ARRAY['water-management-optimization', 'madrid', 'environmental', 'energy-systems', 'global-industrial-consulting'], '2025-01-23 09:00:00', '2026-09-09 12:00:00'),
    ('INE-25-0023', 'Advanced Manufacturing System - Barcelona #23', 'Mock project for industrial activities in Barcelona. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'High', 'Industrial', 'Atlantic Energy Solutions', 'Infrastructure', 'Rui Carvalho', '2025-04-21', '2025-11-28', 407993.28, ARRAY['advanced-manufacturing-system', 'barcelona', 'industrial', 'infrastructure', 'atlantic-energy-solutions'], '2025-01-24 09:00:00', '2026-09-08 12:00:00'),
    ('INE-25-0024', 'Energy Efficiency Improvement - Valencia #24', 'Mock project for consulting activities in Valencia. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'Critical', 'Consulting', 'Iberian Infrastructure Group', 'Environmental Services', 'Ines Rodrigues', '2025-04-26', '2025-12-10', 429112.48, ARRAY['energy-efficiency-improvement', 'valencia', 'consulting', 'environmental-services', 'iberian-infrastructure-group'], '2025-01-25 09:00:00', '2026-09-07 12:00:00'),
    ('INE-25-0025', 'Predictive Maintenance Platform - Bilbao #25', 'Mock project for engineering activities in Bilbao. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'Low', 'Engineering', 'Iberia Manufacturing Group', 'Engineering', 'Andre Correia', '2025-05-01', '2025-12-22', 450579.50, ARRAY['predictive-maintenance-platform', 'bilbao', 'engineering', 'iberia-manufacturing-group'], '2025-01-26 09:00:00', '2026-09-06 12:00:00'),
    ('INE-25-0026', 'Smart Building Implementation - Dublin #26', 'Mock project for energy activities in Dublin. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'Energy', 'Urban Development Alliance', 'Research and Development', 'Joao Ferreira', '2025-05-06', '2026-01-03', 472394.34, ARRAY['smart-building-implementation', 'dublin', 'energy', 'research-and-development', 'urban-development-alliance'], '2025-01-27 09:00:00', '2026-09-05 12:00:00'),
    ('INE-25-0027', 'Research Laboratory Development - Rotterdam #27', 'Mock project for it activities in Rotterdam. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'IT', 'Solaris Energy Group', 'Information Technology', 'Carolina Nunes', '2025-05-11', '2026-01-15', 494557.00, ARRAY['research-laboratory-development', 'rotterdam', 'it', 'information-technology', 'solaris-energy-group'], '2025-01-28 09:00:00', '2026-09-04 12:00:00'),
    ('INE-25-0028', 'Solar Power Installation - Hamburg #28', 'Mock project for research activities in Hamburg. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'Research', 'Alpine Water Management', 'Project Management', 'Sofia Martins', '2025-05-16', '2026-01-27', 517067.48, ARRAY['solar-power-installation', 'hamburg', 'research', 'project-management', 'alpine-water-management'], '2025-01-29 09:00:00', '2026-09-03 12:00:00'),
    ('INE-25-0029', 'Wind Energy Feasibility Study - Lyon #29', 'Mock project for infrastructure activities in Lyon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'High', 'Infrastructure', 'Green Horizon Technologies', 'Operations', 'Leonor Fernandes', '2025-05-21', '2026-02-08', 539925.78, ARRAY['wind-energy-feasibility-study', 'lyon', 'infrastructure', 'operations', 'green-horizon-technologies'], '2025-01-30 09:00:00', '2026-09-02 12:00:00'),
    ('INE-25-0030', 'Industrial IoT Implementation - Brussels #30', 'Mock project for environmental activities in Brussels. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Critical', 'Environmental', 'BlueWave Marine Engineering', 'Energy Systems', 'Diogo Gomes', '2025-05-26', '2026-02-20', 563131.90, ARRAY['industrial-iot-implementation', 'brussels', 'environmental', 'energy-systems', 'bluewave-marine-engineering'], '2025-01-31 09:00:00', '2026-09-01 12:00:00'),
    ('INE-25-0031', 'Renewable Energy Integration - Porto #31', 'Mock project for industrial activities in Porto. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Low', 'Industrial', 'Northstar Industrial Systems', 'Infrastructure', 'Beatriz Santos', '2025-05-31', '2026-03-04', 586685.84, ARRAY['renewable-energy-integration', 'porto', 'industrial', 'infrastructure', 'northstar-industrial-systems'], '2025-02-01 09:00:00', '2026-08-31 12:00:00'),
    ('INE-25-0032', 'Industrial Automation Upgrade - Lisbon #32', 'Mock project for consulting activities in Lisbon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'Medium', 'Consulting', 'Digital Enterprise Partners', 'Environmental Services', 'Goncalo Mendes', '2025-06-05', '2026-03-16', 610587.60, ARRAY['industrial-automation-upgrade', 'lisbon', 'consulting', 'environmental-services', 'digital-enterprise-partners'], '2025-02-02 09:00:00', '2026-08-30 12:00:00'),
    ('INE-25-0033', 'Smart Infrastructure Development - Braga #33', 'Mock project for engineering activities in Braga. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'Medium', 'Engineering', 'European Smart Cities', 'Engineering', 'Matilde Ribeiro', '2025-06-10', '2026-03-28', 568957.85, ARRAY['smart-infrastructure-development', 'braga', 'engineering', 'european-smart-cities'], '2025-02-03 09:00:00', '2026-08-29 12:00:00'),
    ('INE-25-0034', 'Digital Transformation Initiative - Coimbra #34', 'Mock project for energy activities in Coimbra. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'Energy', 'Continental Transport Systems', 'Research and Development', 'Daniel Teixeira', '2025-06-15', '2026-04-09', 591642.24, ARRAY['digital-transformation-initiative', 'coimbra', 'energy', 'research-and-development', 'continental-transport-systems'], '2025-02-04 09:00:00', '2026-08-28 12:00:00'),
    ('INE-25-0035', 'Environmental Monitoring System - Aveiro #35', 'Mock project for it activities in Aveiro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'IT', 'TerraNova Environmental', 'Information Technology', 'Catarina Sousa', '2025-06-20', '2025-08-24', 614674.45, ARRAY['environmental-monitoring-system', 'aveiro', 'it', 'information-technology', 'terranova-environmental'], '2025-02-05 09:00:00', '2026-08-27 12:00:00'),
    ('INE-25-0036', 'Electrical Network Modernization - Faro #36', 'Mock project for research activities in Faro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Critical', 'Research', 'FutureGrid Renewables', 'Project Management', 'Marta Moreira', '2025-06-25', '2025-09-05', 638054.48, ARRAY['electrical-network-modernization', 'faro', 'research', 'project-management', 'futuregrid-renewables'], '2025-02-06 09:00:00', '2026-08-26 12:00:00'),
    ('INE-25-0037', 'Water Management Optimization - Madrid #37', 'Mock project for infrastructure activities in Madrid. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'Low', 'Infrastructure', 'Global Industrial Consulting', 'Operations', 'Mariana Pereira', '2025-06-30', '2025-09-17', 661782.33, ARRAY['water-management-optimization', 'madrid', 'infrastructure', 'operations', 'global-industrial-consulting'], '2025-02-07 09:00:00', '2026-08-25 12:00:00'),
    ('INE-25-0038', 'Advanced Manufacturing System - Barcelona #38', 'Mock project for environmental activities in Barcelona. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Medium', 'Environmental', 'Atlantic Energy Solutions', 'Energy Systems', 'Francisco Lopes', '2025-07-05', '2025-09-29', 685858.00, ARRAY['advanced-manufacturing-system', 'barcelona', 'environmental', 'energy-systems', 'atlantic-energy-solutions'], '2025-02-08 09:00:00', '2026-08-24 12:00:00'),
    ('INE-25-0039', 'Energy Efficiency Improvement - Valencia #39', 'Mock project for industrial activities in Valencia. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Medium', 'Industrial', 'Iberian Infrastructure Group', 'Infrastructure', 'Tiago Oliveira', '2025-07-10', '2025-10-11', 710281.49, ARRAY['energy-efficiency-improvement', 'valencia', 'industrial', 'infrastructure', 'iberian-infrastructure-group'], '2025-02-09 09:00:00', '2026-08-23 12:00:00'),
    ('INE-25-0040', 'Predictive Maintenance Platform - Bilbao #40', 'Mock project for consulting activities in Bilbao. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'High', 'Consulting', 'Iberia Manufacturing Group', 'Environmental Services', 'Pedro Almeida', '2025-07-15', '2025-10-23', 735052.80, ARRAY['predictive-maintenance-platform', 'bilbao', 'consulting', 'environmental-services', 'iberia-manufacturing-group'], '2025-02-10 09:00:00', '2026-08-22 12:00:00'),
    ('INE-25-0041', 'Smart Building Implementation - Dublin #41', 'Mock project for engineering activities in Dublin. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'High', 'Engineering', 'Urban Development Alliance', 'Engineering', 'Miguel Costa', '2025-07-20', '2025-11-04', 760171.93, ARRAY['smart-building-implementation', 'dublin', 'engineering', 'urban-development-alliance'], '2025-02-11 09:00:00', '2026-08-21 12:00:00'),
    ('INE-25-0042', 'Research Laboratory Development - Rotterdam #42', 'Mock project for energy activities in Rotterdam. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Critical', 'Energy', 'Solaris Energy Group', 'Research and Development', 'Ana Silva', '2025-07-25', '2025-11-16', 785638.88, ARRAY['research-laboratory-development', 'rotterdam', 'energy', 'research-and-development', 'solaris-energy-group'], '2025-02-12 09:00:00', '2026-08-20 12:00:00'),
    ('INE-25-0043', 'Solar Power Installation - Hamburg #43', 'Mock project for it activities in Hamburg. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Low', 'IT', 'Alpine Water Management', 'Information Technology', 'Rui Carvalho', '2025-07-30', '2025-11-28', 811453.65, ARRAY['solar-power-installation', 'hamburg', 'it', 'information-technology', 'alpine-water-management'], '2025-02-13 09:00:00', '2026-08-19 12:00:00'),
    ('INE-25-0044', 'Wind Energy Feasibility Study - Lyon #44', 'Mock project for research activities in Lyon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'Research', 'Green Horizon Technologies', 'Project Management', 'Ines Rodrigues', '2025-08-04', '2025-12-10', 750693.80, ARRAY['wind-energy-feasibility-study', 'lyon', 'research', 'project-management', 'green-horizon-technologies'], '2025-02-14 09:00:00', '2026-08-18 12:00:00'),
    ('INE-25-0045', 'Industrial IoT Implementation - Brussels #45', 'Mock project for infrastructure activities in Brussels. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'Medium', 'Infrastructure', 'BlueWave Marine Engineering', 'Operations', 'Andre Correia', '2025-08-09', '2025-12-22', 775291.20, ARRAY['industrial-iot-implementation', 'brussels', 'infrastructure', 'operations', 'bluewave-marine-engineering'], '2025-02-15 09:00:00', '2026-08-17 12:00:00'),
    ('INE-25-0046', 'Renewable Energy Integration - Porto #46', 'Mock project for environmental activities in Porto. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'High', 'Environmental', 'Northstar Industrial Systems', 'Energy Systems', 'Joao Ferreira', '2025-08-14', '2026-01-03', 800236.42, ARRAY['renewable-energy-integration', 'porto', 'environmental', 'energy-systems', 'northstar-industrial-systems'], '2025-02-16 09:00:00', '2026-08-16 12:00:00'),
    ('INE-25-0047', 'Industrial Automation Upgrade - Lisbon #47', 'Mock project for industrial activities in Lisbon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'High', 'Industrial', 'Digital Enterprise Partners', 'Infrastructure', 'Carolina Nunes', '2025-08-19', '2026-01-15', 825529.46, ARRAY['industrial-automation-upgrade', 'lisbon', 'industrial', 'infrastructure', 'digital-enterprise-partners'], '2025-02-17 09:00:00', '2026-08-15 12:00:00'),
    ('INE-25-0048', 'Smart Infrastructure Development - Braga #48', 'Mock project for consulting activities in Braga. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'Critical', 'Consulting', 'European Smart Cities', 'Environmental Services', 'Sofia Martins', '2025-08-24', '2026-01-27', 851170.32, ARRAY['smart-infrastructure-development', 'braga', 'consulting', 'environmental-services', 'european-smart-cities'], '2025-02-18 09:00:00', '2026-08-14 12:00:00'),
    ('INE-25-0049', 'Digital Transformation Initiative - Coimbra #49', 'Mock project for engineering activities in Coimbra. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'Low', 'Engineering', 'Continental Transport Systems', 'Engineering', 'Leonor Fernandes', '2025-08-29', '2026-02-08', 877159.00, ARRAY['digital-transformation-initiative', 'coimbra', 'engineering', 'continental-transport-systems'], '2025-02-19 09:00:00', '2026-08-13 12:00:00'),
    ('INE-25-0050', 'Environmental Monitoring System - Aveiro #50', 'Mock project for energy activities in Aveiro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'Energy', 'TerraNova Environmental', 'Research and Development', 'Diogo Gomes', '2025-09-03', '2026-02-20', 903495.50, ARRAY['environmental-monitoring-system', 'aveiro', 'energy', 'research-and-development', 'terranova-environmental'], '2025-02-20 09:00:00', '2026-08-12 12:00:00'),
    ('INE-25-0051', 'Electrical Network Modernization - Faro #51', 'Mock project for it activities in Faro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'IT', 'FutureGrid Renewables', 'Information Technology', 'Beatriz Santos', '2025-09-08', '2026-03-04', 930179.82, ARRAY['electrical-network-modernization', 'faro', 'it', 'information-technology', 'futuregrid-renewables'], '2025-02-21 09:00:00', '2026-08-11 12:00:00'),
    ('INE-25-0052', 'Water Management Optimization - Madrid #52', 'Mock project for research activities in Madrid. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'Research', 'Global Industrial Consulting', 'Project Management', 'Goncalo Mendes', '2025-09-13', '2026-03-16', 957211.96, ARRAY['water-management-optimization', 'madrid', 'research', 'project-management', 'global-industrial-consulting'], '2025-02-22 09:00:00', '2026-08-10 12:00:00'),
    ('INE-25-0053', 'Advanced Manufacturing System - Barcelona #53', 'Mock project for infrastructure activities in Barcelona. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'High', 'Infrastructure', 'Atlantic Energy Solutions', 'Operations', 'Matilde Ribeiro', '2025-09-18', '2026-03-28', 984591.92, ARRAY['advanced-manufacturing-system', 'barcelona', 'infrastructure', 'operations', 'atlantic-energy-solutions'], '2025-02-23 09:00:00', '2026-08-09 12:00:00'),
    ('INE-25-0054', 'Energy Efficiency Improvement - Valencia #54', 'Mock project for environmental activities in Valencia. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Critical', 'Environmental', 'Iberian Infrastructure Group', 'Energy Systems', 'Daniel Teixeira', '2025-09-23', '2026-04-09', 1012319.70, ARRAY['energy-efficiency-improvement', 'valencia', 'environmental', 'energy-systems', 'iberian-infrastructure-group'], '2025-02-24 09:00:00', '2026-08-08 12:00:00'),
    ('INE-25-0055', 'Predictive Maintenance Platform - Bilbao #55', 'Mock project for industrial activities in Bilbao. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Low', 'Industrial', 'Iberia Manufacturing Group', 'Infrastructure', 'Catarina Sousa', '2025-09-28', '2026-04-21', 932429.75, ARRAY['predictive-maintenance-platform', 'bilbao', 'industrial', 'infrastructure', 'iberia-manufacturing-group'], '2025-02-25 09:00:00', '2026-08-07 12:00:00'),
    ('INE-25-0056', 'Smart Building Implementation - Dublin #56', 'Mock project for consulting activities in Dublin. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'Medium', 'Consulting', 'Urban Development Alliance', 'Environmental Services', 'Marta Moreira', '2025-10-03', '2026-05-03', 958940.16, ARRAY['smart-building-implementation', 'dublin', 'consulting', 'environmental-services', 'urban-development-alliance'], '2025-02-26 09:00:00', '2026-08-06 12:00:00'),
    ('INE-25-0057', 'Research Laboratory Development - Rotterdam #57', 'Mock project for engineering activities in Rotterdam. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'Medium', 'Engineering', 'Solaris Energy Group', 'Engineering', 'Mariana Pereira', '2025-10-08', '2026-05-15', 40048.39, ARRAY['research-laboratory-development', 'rotterdam', 'engineering', 'solaris-energy-group'], '2025-02-27 09:00:00', '2026-08-05 12:00:00'),
    ('INE-25-0058', 'Solar Power Installation - Hamburg #58', 'Mock project for energy activities in Hamburg. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'Energy', 'Alpine Water Management', 'Research and Development', 'Francisco Lopes', '2025-10-13', '2026-05-27', 57504.44, ARRAY['solar-power-installation', 'hamburg', 'energy', 'research-and-development', 'alpine-water-management'], '2025-02-28 09:00:00', '2026-08-04 12:00:00'),
    ('INE-25-0059', 'Wind Energy Feasibility Study - Lyon #59', 'Mock project for it activities in Lyon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'High', 'IT', 'Green Horizon Technologies', 'Information Technology', 'Tiago Oliveira', '2025-10-18', '2026-06-08', 75308.31, ARRAY['wind-energy-feasibility-study', 'lyon', 'it', 'information-technology', 'green-horizon-technologies'], '2025-03-01 09:00:00', '2026-08-03 12:00:00'),
    ('INE-25-0060', 'Industrial IoT Implementation - Brussels #60', 'Mock project for research activities in Brussels. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Critical', 'Research', 'BlueWave Marine Engineering', 'Project Management', 'Pedro Almeida', '2025-10-23', '2026-06-20', 93460.00, ARRAY['industrial-iot-implementation', 'brussels', 'research', 'project-management', 'bluewave-marine-engineering'], '2025-03-02 09:00:00', '2026-10-01 12:00:00'),
    ('INE-25-0061', 'Renewable Energy Integration - Porto #61', 'Mock project for infrastructure activities in Porto. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'Low', 'Infrastructure', 'Northstar Industrial Systems', 'Operations', 'Miguel Costa', '2025-10-28', '2026-07-02', 111959.51, ARRAY['renewable-energy-integration', 'porto', 'infrastructure', 'operations', 'northstar-industrial-systems'], '2025-03-03 09:00:00', '2026-09-30 12:00:00'),
    ('INE-25-0062', 'Industrial Automation Upgrade - Lisbon #62', 'Mock project for environmental activities in Lisbon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Medium', 'Environmental', 'Digital Enterprise Partners', 'Energy Systems', 'Ana Silva', '2025-11-02', '2026-07-14', 130806.84, ARRAY['industrial-automation-upgrade', 'lisbon', 'environmental', 'energy-systems', 'digital-enterprise-partners'], '2025-03-04 09:00:00', '2026-09-29 12:00:00'),
    ('INE-25-0063', 'Smart Infrastructure Development - Braga #63', 'Mock project for industrial activities in Braga. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'Medium', 'Industrial', 'European Smart Cities', 'Infrastructure', 'Rui Carvalho', '2025-11-07', '2026-07-26', 150001.99, ARRAY['smart-infrastructure-development', 'braga', 'industrial', 'infrastructure', 'european-smart-cities'], '2025-03-05 09:00:00', '2026-09-28 12:00:00'),
    ('INE-25-0064', 'Digital Transformation Initiative - Coimbra #64', 'Mock project for consulting activities in Coimbra. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'High', 'Consulting', 'Continental Transport Systems', 'Environmental Services', 'Ines Rodrigues', '2025-11-12', '2026-08-07', 169544.96, ARRAY['digital-transformation-initiative', 'coimbra', 'consulting', 'environmental-services', 'continental-transport-systems'], '2025-03-06 09:00:00', '2026-09-27 12:00:00'),
    ('INE-25-0065', 'Environmental Monitoring System - Aveiro #65', 'Mock project for engineering activities in Aveiro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'High', 'Engineering', 'TerraNova Environmental', 'Engineering', 'Andre Correia', '2025-11-17', '2026-08-19', 189435.75, ARRAY['environmental-monitoring-system', 'aveiro', 'engineering', 'terranova-environmental'], '2025-03-07 09:00:00', '2026-09-26 12:00:00'),
    ('INE-25-0066', 'Electrical Network Modernization - Faro #66', 'Mock project for energy activities in Faro. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Critical', 'Energy', 'FutureGrid Renewables', 'Research and Development', 'Joao Ferreira', '2025-11-22', '2026-08-31', 187915.70, ARRAY['electrical-network-modernization', 'faro', 'energy', 'research-and-development', 'futuregrid-renewables'], '2025-03-08 09:00:00', '2026-09-25 12:00:00'),
    ('INE-25-0067', 'Water Management Optimization - Madrid #67', 'Mock project for it activities in Madrid. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Low', 'IT', 'Global Industrial Consulting', 'Information Technology', 'Carolina Nunes', '2025-11-27', '2026-09-12', 206589.12, ARRAY['water-management-optimization', 'madrid', 'it', 'information-technology', 'global-industrial-consulting'], '2025-03-09 09:00:00', '2026-09-24 12:00:00'),
    ('INE-25-0068', 'Advanced Manufacturing System - Barcelona #68', 'Mock project for research activities in Barcelona. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'Research', 'Atlantic Energy Solutions', 'Project Management', 'Sofia Martins', '2025-12-02', '2026-09-24', 225610.36, ARRAY['advanced-manufacturing-system', 'barcelona', 'research', 'project-management', 'atlantic-energy-solutions'], '2025-03-10 09:00:00', '2026-09-23 12:00:00'),
    ('INE-25-0069', 'Energy Efficiency Improvement - Valencia #69', 'Mock project for infrastructure activities in Valencia. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'On Hold', 'Medium', 'Infrastructure', 'Iberian Infrastructure Group', 'Operations', 'Leonor Fernandes', '2025-12-07', '2026-02-08', 244979.42, ARRAY['energy-efficiency-improvement', 'valencia', 'infrastructure', 'operations', 'iberian-infrastructure-group'], '2025-03-11 09:00:00', '2026-09-22 12:00:00'),
    ('INE-25-0070', 'Predictive Maintenance Platform - Bilbao #70', 'Mock project for environmental activities in Bilbao. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'High', 'Environmental', 'Iberia Manufacturing Group', 'Energy Systems', 'Diogo Gomes', '2025-12-12', '2026-02-20', 264696.30, ARRAY['predictive-maintenance-platform', 'bilbao', 'environmental', 'energy-systems', 'iberia-manufacturing-group'], '2025-03-12 09:00:00', '2026-09-21 12:00:00'),
    ('INE-25-0071', 'Smart Building Implementation - Dublin #71', 'Mock project for industrial activities in Dublin. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Completed', 'High', 'Industrial', 'Urban Development Alliance', 'Infrastructure', 'Beatriz Santos', '2025-12-17', '2026-03-04', 284761.00, ARRAY['smart-building-implementation', 'dublin', 'industrial', 'infrastructure', 'urban-development-alliance'], '2025-03-13 09:00:00', '2026-09-20 12:00:00'),
    ('INE-25-0072', 'Research Laboratory Development - Rotterdam #72', 'Mock project for consulting activities in Rotterdam. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Cancelled', 'Critical', 'Consulting', 'Solaris Energy Group', 'Environmental Services', 'Goncalo Mendes', '2025-12-22', '2026-03-16', 305173.52, ARRAY['research-laboratory-development', 'rotterdam', 'consulting', 'environmental-services', 'solaris-energy-group'], '2025-03-14 09:00:00', '2026-09-19 12:00:00'),
    ('INE-25-0073', 'Solar Power Installation - Hamburg #73', 'Mock project for engineering activities in Hamburg. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Planned', 'Low', 'Engineering', 'Alpine Water Management', 'Engineering', 'Matilde Ribeiro', '2025-12-27', '2026-03-28', 325933.86, ARRAY['solar-power-installation', 'hamburg', 'engineering', 'alpine-water-management'], '2025-03-15 09:00:00', '2026-09-18 12:00:00'),
    ('INE-26-0074', 'Wind Energy Feasibility Study - Lyon #74', 'Mock project for energy activities in Lyon. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'Energy', 'Green Horizon Technologies', 'Research and Development', 'Daniel Teixeira', '2026-01-01', '2026-04-09', 347042.02, ARRAY['wind-energy-feasibility-study', 'lyon', 'energy', 'research-and-development', 'green-horizon-technologies'], '2025-03-16 09:00:00', '2026-09-17 12:00:00'),
    ('INE-26-0075', 'Industrial IoT Implementation - Brussels #75', 'Mock project for it activities in Brussels. Scope includes requirements analysis, planning, execution, quality assurance, risk management, stakeholder coordination, and final delivery.', 'Active', 'Medium', 'IT', 'BlueWave Marine Engineering', 'Information Technology', 'Catarina Sousa', '2026-01-06', '2026-04-21', 368498.00, ARRAY['industrial-iot-implementation', 'brussels', 'it', 'information-technology', 'bluewave-marine-engineering'], '2025-03-17 09:00:00', '2026-09-16 12:00:00')
ON CONFLICT (id) DO NOTHING;

INSERT INTO project_researchers (project_id, researcher_id)
VALUES
    -- INE-25-0001
    ('INE-25-0001', 1),
    ('INE-25-0001', 2),
    ('INE-25-0001', 5),
    ('INE-25-0001', 13),

    -- INE-25-0002
    ('INE-25-0002', 4),
    ('INE-25-0002', 6),
    ('INE-25-0002', 8),
    ('INE-25-0002', 19),

    -- INE-25-0003
    ('INE-25-0003', 10),
    ('INE-25-0003', 12),
    ('INE-25-0003', 14),
    ('INE-25-0003', 16),

    -- INE-25-0004
    ('INE-25-0004', 15),
    ('INE-25-0004', 17),
    ('INE-25-0004', 18),
    ('INE-25-0004', 24),

    -- INE-25-0005
    ('INE-25-0005', 19),
    ('INE-25-0005', 20),
    ('INE-25-0005', 22),
    ('INE-25-0005', 23),

    -- INE-25-0006
    ('INE-25-0006', 25),
    ('INE-25-0006', 26),
    ('INE-25-0006', 27),
    ('INE-25-0006', 28),

    -- INE-25-0007
    ('INE-25-0007', 1),
    ('INE-25-0007', 28),
    ('INE-25-0007', 29),
    ('INE-25-0007', 30),

    -- INE-25-0008
    ('INE-25-0008', 31),
    ('INE-25-0008', 32),
    ('INE-25-0008', 33),
    ('INE-25-0008', 34),

    -- INE-25-0009
    ('INE-25-0009', 2),
    ('INE-25-0009', 5),
    ('INE-25-0009', 8),
    ('INE-25-0009', 29),

    -- INE-25-0010
    ('INE-25-0010', 4),
    ('INE-25-0010', 13),
    ('INE-25-0010', 19),
    ('INE-25-0010', 35),

    -- INE-25-0011
    ('INE-25-0011', 6),
    ('INE-25-0011', 10),
    ('INE-25-0011', 16),
    ('INE-25-0011', 18),

    -- INE-25-0012
    ('INE-25-0012', 12),
    ('INE-25-0012', 14),
    ('INE-25-0012', 17),
    ('INE-25-0012', 23),

    -- INE-25-0013
    ('INE-25-0013', 15),
    ('INE-25-0013', 18),
    ('INE-25-0013', 24),
    ('INE-25-0013', 27),

    -- INE-25-0014
    ('INE-25-0014', 20),
    ('INE-25-0014', 22),
    ('INE-25-0014', 25),
    ('INE-25-0014', 30),

    -- INE-25-0015
    ('INE-25-0015', 26),
    ('INE-25-0015', 28),
    ('INE-25-0015', 29),
    ('INE-25-0015', 31),

    -- INE-25-0016
    ('INE-25-0016', 1),
    ('INE-25-0016', 5),
    ('INE-25-0016', 13),
    ('INE-25-0016', 32),

    -- INE-25-0017
    ('INE-25-0017', 2),
    ('INE-25-0017', 6),
    ('INE-25-0017', 10),
    ('INE-25-0017', 33),

    -- INE-25-0018
    ('INE-25-0018', 4),
    ('INE-25-0018', 8),
    ('INE-25-0018', 19),
    ('INE-25-0018', 34),

    -- INE-25-0019
    ('INE-25-0019', 12),
    ('INE-25-0019', 14),
    ('INE-25-0019', 16),
    ('INE-25-0019', 35),

    -- INE-25-0020
    ('INE-25-0020', 17),
    ('INE-25-0020', 18),
    ('INE-25-0020', 24),
    ('INE-25-0020', 28),

    -- INE-25-0021
    ('INE-25-0021', 1),
    ('INE-25-0021', 2),
    ('INE-25-0021', 29),
    ('INE-25-0021', 30),

    -- INE-25-0022
    ('INE-25-0022', 5),
    ('INE-25-0022', 13),
    ('INE-25-0022', 15),
    ('INE-25-0022', 31),

    -- INE-25-0023
    ('INE-25-0023', 6),
    ('INE-25-0023', 10),
    ('INE-25-0023', 18),
    ('INE-25-0023', 32),

    -- INE-25-0024
    ('INE-25-0024', 19),
    ('INE-25-0024', 20),
    ('INE-25-0024', 22),
    ('INE-25-0024', 33),

    -- INE-25-0025
    ('INE-25-0025', 23),
    ('INE-25-0025', 25),
    ('INE-25-0025', 26),
    ('INE-25-0025', 34),

    -- INE-25-0026
    ('INE-25-0026', 27),
    ('INE-25-0026', 28),
    ('INE-25-0026', 29),
    ('INE-25-0026', 35),

    -- INE-25-0027
    ('INE-25-0027', 1),
    ('INE-25-0027', 4),
    ('INE-25-0027', 8),
    ('INE-25-0027', 16),

    -- INE-25-0028
    ('INE-25-0028', 2),
    ('INE-25-0028', 5),
    ('INE-25-0028', 13),
    ('INE-25-0028', 17),

    -- INE-25-0029
    ('INE-25-0029', 6),
    ('INE-25-0029', 10),
    ('INE-25-0029', 14),
    ('INE-25-0029', 18),

    -- INE-25-0030
    ('INE-25-0030', 12),
    ('INE-25-0030', 15),
    ('INE-25-0030', 19),
    ('INE-25-0030', 24),

    -- INE-25-0031
    ('INE-25-0031', 20),
    ('INE-25-0031', 22),
    ('INE-25-0031', 23),
    ('INE-25-0031', 25),

    -- INE-25-0032
    ('INE-25-0032', 26),
    ('INE-25-0032', 27),
    ('INE-25-0032', 28),
    ('INE-25-0032', 29),

    -- INE-25-0033
    ('INE-25-0033', 1),
    ('INE-25-0033', 2),
    ('INE-25-0033', 30),
    ('INE-25-0033', 31),

    -- INE-25-0034
    ('INE-25-0034', 4),
    ('INE-25-0034', 5),
    ('INE-25-0034', 32),
    ('INE-25-0034', 33),

    -- INE-25-0035
    ('INE-25-0035', 6),
    ('INE-25-0035', 8),
    ('INE-25-0035', 13),
    ('INE-25-0035', 34),

    -- INE-25-0036
    ('INE-25-0036', 10),
    ('INE-25-0036', 12),
    ('INE-25-0036', 14),
    ('INE-25-0036', 35),

    -- INE-25-0037
    ('INE-25-0037', 15),
    ('INE-25-0037', 16),
    ('INE-25-0037', 17),
    ('INE-25-0037', 18),

    -- INE-25-0038
    ('INE-25-0038', 19),
    ('INE-25-0038', 20),
    ('INE-25-0038', 22),
    ('INE-25-0038', 23),

    -- INE-25-0039
    ('INE-25-0039', 24),
    ('INE-25-0039', 25),
    ('INE-25-0039', 26),
    ('INE-25-0039', 27),

    -- INE-25-0040
    ('INE-25-0040', 28),
    ('INE-25-0040', 29),
    ('INE-25-0040', 30),
    ('INE-25-0040', 31),

    -- INE-25-0041
    ('INE-25-0041', 1),
    ('INE-25-0041', 5),
    ('INE-25-0041', 10),
    ('INE-25-0041', 32),

    -- INE-25-0042
    ('INE-25-0042', 2),
    ('INE-25-0042', 6),
    ('INE-25-0042', 13),
    ('INE-25-0042', 33),

    -- INE-25-0043
    ('INE-25-0043', 4),
    ('INE-25-0043', 8),
    ('INE-25-0043', 14),
    ('INE-25-0043', 34),

    -- INE-25-0044
    ('INE-25-0044', 12),
    ('INE-25-0044', 15),
    ('INE-25-0044', 16),
    ('INE-25-0044', 35),

    -- INE-25-0045
    ('INE-25-0045', 17),
    ('INE-25-0045', 18),
    ('INE-25-0045', 19),
    ('INE-25-0045', 20),

    -- INE-25-0046
    ('INE-25-0046', 22),
    ('INE-25-0046', 23),
    ('INE-25-0046', 24),
    ('INE-25-0046', 25),

    -- INE-25-0047
    ('INE-25-0047', 26),
    ('INE-25-0047', 27),
    ('INE-25-0047', 28),
    ('INE-25-0047', 29),

    -- INE-25-0048
    ('INE-25-0048', 30),
    ('INE-25-0048', 31),
    ('INE-25-0048', 32),
    ('INE-25-0048', 33),

    -- INE-25-0049
    ('INE-25-0049', 1),
    ('INE-25-0049', 2),
    ('INE-25-0049', 34),
    ('INE-25-0049', 35),

    -- INE-25-0050
    ('INE-25-0050', 4),
    ('INE-25-0050', 5),
    ('INE-25-0050', 13),
    ('INE-25-0050', 18),

    -- INE-25-0051
    ('INE-25-0051', 6),
    ('INE-25-0051', 10),
    ('INE-25-0051', 19),
    ('INE-25-0051', 24),

    -- INE-25-0052
    ('INE-25-0052', 8),
    ('INE-25-0052', 12),
    ('INE-25-0052', 14),
    ('INE-25-0052', 25),

    -- INE-25-0053
    ('INE-25-0053', 15),
    ('INE-25-0053', 16),
    ('INE-25-0053', 17),
    ('INE-25-0053', 26),

    -- INE-25-0054
    ('INE-25-0054', 20),
    ('INE-25-0054', 22),
    ('INE-25-0054', 23),
    ('INE-25-0054', 27),

    -- INE-25-0055
    ('INE-25-0055', 28),
    ('INE-25-0055', 29),
    ('INE-25-0055', 30),
    ('INE-25-0055', 31),

    -- INE-25-0056
    ('INE-25-0056', 1),
    ('INE-25-0056', 5),
    ('INE-25-0056', 32),
    ('INE-25-0056', 33),

    -- INE-25-0057
    ('INE-25-0057', 2),
    ('INE-25-0057', 6),
    ('INE-25-0057', 34),
    ('INE-25-0057', 35),

    -- INE-25-0058
    ('INE-25-0058', 4),
    ('INE-25-0058', 8),
    ('INE-25-0058', 13),
    ('INE-25-0058', 19),

    -- INE-25-0059
    ('INE-25-0059', 10),
    ('INE-25-0059', 12),
    ('INE-25-0059', 14),
    ('INE-25-0059', 20),

    -- INE-25-0060
    ('INE-25-0060', 15),
    ('INE-25-0060', 16),
    ('INE-25-0060', 18),
    ('INE-25-0060', 22),

    -- INE-25-0061
    ('INE-25-0061', 23),
    ('INE-25-0061', 24),
    ('INE-25-0061', 25),
    ('INE-25-0061', 26),

    -- INE-25-0062
    ('INE-25-0062', 27),
    ('INE-25-0062', 28),
    ('INE-25-0062', 29),
    ('INE-25-0062', 30),

    -- INE-25-0063
    ('INE-25-0063', 1),
    ('INE-25-0063', 2),
    ('INE-25-0063', 31),
    ('INE-25-0063', 32),

    -- INE-25-0064
    ('INE-25-0064', 4),
    ('INE-25-0064', 5),
    ('INE-25-0064', 33),
    ('INE-25-0064', 34),

    -- INE-25-0065
    ('INE-25-0065', 6),
    ('INE-25-0065', 8),
    ('INE-25-0065', 13),
    ('INE-25-0065', 35),

    -- INE-25-0066
    ('INE-25-0066', 10),
    ('INE-25-0066', 12),
    ('INE-25-0066', 14),
    ('INE-25-0066', 15),

    -- INE-25-0067
    ('INE-25-0067', 16),
    ('INE-25-0067', 17),
    ('INE-25-0067', 18),
    ('INE-25-0067', 19),

    -- INE-25-0068
    ('INE-25-0068', 20),
    ('INE-25-0068', 22),
    ('INE-25-0068', 23),
    ('INE-25-0068', 24),

    -- INE-25-0069
    ('INE-25-0069', 25),
    ('INE-25-0069', 26),
    ('INE-25-0069', 27),
    ('INE-25-0069', 28),

    -- INE-25-0070
    ('INE-25-0070', 29),
    ('INE-25-0070', 30),
    ('INE-25-0070', 31),
    ('INE-25-0070', 32),

    -- INE-25-0071
    ('INE-25-0071', 1),
    ('INE-25-0071', 4),
    ('INE-25-0071', 13),
    ('INE-25-0071', 33),

    -- INE-25-0072
    ('INE-25-0072', 2),
    ('INE-25-0072', 5),
    ('INE-25-0072', 34),
    ('INE-25-0072', 35),

    -- INE-25-0073
    ('INE-25-0073', 6),
    ('INE-25-0073', 8),
    ('INE-25-0073', 10),
    ('INE-25-0073', 19),

    -- INE-26-0074
    ('INE-26-0074', 1),
    ('INE-26-0074', 13),
    ('INE-26-0074', 28),
    ('INE-26-0074', 29),

    -- INE-26-0075
    ('INE-26-0075', 2),
    ('INE-26-0075', 6),
    ('INE-26-0075', 16),
    ('INE-26-0075', 18)
ON CONFLICT (project_id, researcher_id) DO NOTHING;

INSERT INTO project_grants 
    (project_id, grant_id)
VALUES
    ('INE-25-0001', 1001),
    ('INE-25-0002', 1002),
    ('INE-25-0001', 1003)
ON CONFLICT (grant_id) DO NOTHING;

-- Ids from h.i services/partners-api/seed.json.
INSERT INTO project_partners (project_id, partner_id)
VALUES
    ('INE-25-0001', 'p1'),
    ('INE-25-0001', 'p19'),
    ('INE-25-0002', 'p5'),
    ('INE-25-0002', 'p13'),
    ('INE-25-0003', 'p1'),
    ('INE-25-0003', 'p3'),
    ('INE-25-0004', 'p1'),
    ('INE-25-0004', 'p17'),
    ('INE-25-0005', 'p5'),
    ('INE-25-0005', 'p14'),
    ('INE-25-0006', 'p5'),
    ('INE-25-0006', 'p18'),
    ('INE-25-0006', 'p19'),
    ('INE-25-0007', 'p7'),
    ('INE-25-0007', 'p20'),
    ('INE-25-0008', 'p7'),
    ('INE-25-0008', 'p10'),
    ('INE-25-0008', 'p13'),
    ('INE-25-0009', 'p4'),
    ('INE-25-0009', 'p7'),
    ('INE-25-0010', 'p11'),
    ('INE-25-0010', 'p13'),
    ('INE-25-0011', 'p8'),
    ('INE-25-0011', 'p16'),
    ('INE-25-0012', 'p2'),
    ('INE-25-0012', 'p4'),
    ('INE-25-0012', 'p11'),
    ('INE-25-0013', 'p3'),
    ('INE-25-0013', 'p19'),
    ('INE-25-0014', 'p2'),
    ('INE-25-0014', 'p9'),
    ('INE-25-0014', 'p14'),
    ('INE-25-0015', 'p6'),
    ('INE-25-0015', 'p12'),
    ('INE-25-0015', 'p15'),
    ('INE-25-0016', 'p1'),
    ('INE-25-0016', 'p19'),
    ('INE-25-0017', 'p5'),
    ('INE-25-0017', 'p13'),
    ('INE-25-0018', 'p1'),
    ('INE-25-0018', 'p3'),
    ('INE-25-0019', 'p1'),
    ('INE-25-0019', 'p17'),
    ('INE-25-0020', 'p5'),
    ('INE-25-0020', 'p14'),
    ('INE-25-0021', 'p5'),
    ('INE-25-0021', 'p18'),
    ('INE-25-0021', 'p19'),
    ('INE-25-0022', 'p7'),
    ('INE-25-0022', 'p20'),
    ('INE-25-0023', 'p7'),
    ('INE-25-0023', 'p10'),
    ('INE-25-0023', 'p13'),
    ('INE-25-0024', 'p4'),
    ('INE-25-0024', 'p7'),
    ('INE-25-0025', 'p11'),
    ('INE-25-0025', 'p13'),
    ('INE-25-0026', 'p8'),
    ('INE-25-0026', 'p16'),
    ('INE-25-0027', 'p2'),
    ('INE-25-0027', 'p4'),
    ('INE-25-0027', 'p11'),
    ('INE-25-0028', 'p3'),
    ('INE-25-0028', 'p19'),
    ('INE-25-0029', 'p2'),
    ('INE-25-0029', 'p9'),
    ('INE-25-0029', 'p14'),
    ('INE-25-0030', 'p6'),
    ('INE-25-0030', 'p12'),
    ('INE-25-0030', 'p15'),
    ('INE-25-0031', 'p1'),
    ('INE-25-0031', 'p19'),
    ('INE-25-0032', 'p5'),
    ('INE-25-0032', 'p13'),
    ('INE-25-0033', 'p1'),
    ('INE-25-0033', 'p3'),
    ('INE-25-0034', 'p1'),
    ('INE-25-0034', 'p17'),
    ('INE-25-0035', 'p5'),
    ('INE-25-0035', 'p14'),
    ('INE-25-0036', 'p5'),
    ('INE-25-0036', 'p18'),
    ('INE-25-0036', 'p19'),
    ('INE-25-0037', 'p7'),
    ('INE-25-0037', 'p20'),
    ('INE-25-0038', 'p7'),
    ('INE-25-0038', 'p10'),
    ('INE-25-0038', 'p13'),
    ('INE-25-0039', 'p4'),
    ('INE-25-0039', 'p7'),
    ('INE-25-0040', 'p11'),
    ('INE-25-0040', 'p13'),
    ('INE-25-0041', 'p8'),
    ('INE-25-0041', 'p16'),
    ('INE-25-0042', 'p2'),
    ('INE-25-0042', 'p4'),
    ('INE-25-0042', 'p11'),
    ('INE-25-0043', 'p3'),
    ('INE-25-0043', 'p19'),
    ('INE-25-0044', 'p2'),
    ('INE-25-0044', 'p9'),
    ('INE-25-0044', 'p14'),
    ('INE-25-0045', 'p6'),
    ('INE-25-0045', 'p12'),
    ('INE-25-0045', 'p15'),
    ('INE-25-0046', 'p1'),
    ('INE-25-0046', 'p19'),
    ('INE-25-0047', 'p5'),
    ('INE-25-0047', 'p13'),
    ('INE-25-0048', 'p1'),
    ('INE-25-0048', 'p3'),
    ('INE-25-0049', 'p1'),
    ('INE-25-0049', 'p17'),
    ('INE-25-0050', 'p5'),
    ('INE-25-0050', 'p14'),
    ('INE-25-0051', 'p5'),
    ('INE-25-0051', 'p18'),
    ('INE-25-0051', 'p19'),
    ('INE-25-0052', 'p7'),
    ('INE-25-0052', 'p20'),
    ('INE-25-0053', 'p7'),
    ('INE-25-0053', 'p10'),
    ('INE-25-0053', 'p13'),
    ('INE-25-0054', 'p4'),
    ('INE-25-0054', 'p7'),
    ('INE-25-0055', 'p11'),
    ('INE-25-0055', 'p13'),
    ('INE-25-0056', 'p8'),
    ('INE-25-0056', 'p16'),
    ('INE-25-0057', 'p2'),
    ('INE-25-0057', 'p4'),
    ('INE-25-0057', 'p11'),
    ('INE-25-0058', 'p3'),
    ('INE-25-0058', 'p19'),
    ('INE-25-0059', 'p2'),
    ('INE-25-0059', 'p9'),
    ('INE-25-0059', 'p14'),
    ('INE-25-0060', 'p6'),
    ('INE-25-0060', 'p12'),
    ('INE-25-0060', 'p15'),
    ('INE-25-0061', 'p1'),
    ('INE-25-0061', 'p19'),
    ('INE-25-0062', 'p5'),
    ('INE-25-0062', 'p13'),
    ('INE-25-0063', 'p1'),
    ('INE-25-0063', 'p3'),
    ('INE-25-0064', 'p1'),
    ('INE-25-0064', 'p17'),
    ('INE-25-0065', 'p5'),
    ('INE-25-0065', 'p14'),
    ('INE-25-0066', 'p5'),
    ('INE-25-0066', 'p18'),
    ('INE-25-0066', 'p19'),
    ('INE-25-0067', 'p7'),
    ('INE-25-0067', 'p20'),
    ('INE-25-0068', 'p7'),
    ('INE-25-0068', 'p10'),
    ('INE-25-0068', 'p13'),
    ('INE-25-0069', 'p4'),
    ('INE-25-0069', 'p7'),
    ('INE-25-0070', 'p11'),
    ('INE-25-0070', 'p13'),
    ('INE-25-0071', 'p8'),
    ('INE-25-0071', 'p16'),
    ('INE-25-0072', 'p2'),
    ('INE-25-0072', 'p4'),
    ('INE-25-0072', 'p11'),
    ('INE-25-0073', 'p3'),
    ('INE-25-0073', 'p19'),
    ('INE-26-0074', 'p2'),
    ('INE-26-0074', 'p9'),
    ('INE-26-0074', 'p14'),
    ('INE-26-0075', 'p6'),
    ('INE-26-0075', 'p12'),
    ('INE-26-0075', 'p15')
ON CONFLICT (project_id, partner_id) DO NOTHING;
