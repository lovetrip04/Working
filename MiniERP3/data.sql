--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: company_codes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.company_codes VALUES (1, 'US01', 'ACME Corporation USA', NULL, 'USD', 'United States', NULL, 'Calendar Year (Jan-Dec)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2025-05-17 13:43:44.835584', NULL, '2025-05-17 13:43:44.835584', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (2, 'EU01', 'ACME Europe GmbH', NULL, 'EUR', 'Germany', NULL, 'Calendar Year (Jan-Dec)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2025-05-17 13:43:44.835584', NULL, '2025-05-17 13:43:44.835584', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (4, 'TEST02', 'Test Company 2', NULL, 'USD', 'United States', NULL, 'Calendar Year (Jan-Dec)', NULL, NULL, NULL, NULL, NULL, NULL, 'https://example.com', NULL, true, '2025-05-18 00:40:52.466', NULL, '2025-05-18 00:40:52.466', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (5, 'CA01', 'CMIS Association', 'CMIS Canada', 'CAD', 'Canada', '', 'Calendar Year (Jan-Dec)', '', '', '', '', '', NULL, NULL, NULL, true, '2025-05-18 01:05:01.453', NULL, '2025-05-18 01:05:01.453', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (7, 'GA01', 'Germany', '', 'EUR', 'Germany', '', 'Calendar Year (Jan-Dec)', '', '', '', '', '', NULL, NULL, NULL, true, '2025-05-19 21:59:41.861', NULL, '2025-05-19 22:00:29.936', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (6, 'IN01', 'India Company Code', 'India Company Code', 'INR', 'United States', '', 'Calendar Year (Jan-Dec)', 'Gandhi Road', 'Bangalore', '', '', '', NULL, NULL, NULL, true, '2025-05-19 21:48:54.52', NULL, '2025-05-19 22:31:18.93', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (3, 'TEST01', 'Mexico Company', '', 'MXN', 'Mexico', '', 'Calendar Year (Jan-Dec)', '', '', '', '', '', NULL, NULL, NULL, true, '2025-05-18 00:35:00.714', NULL, '2025-05-19 22:50:46.093', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (9, 'DE01', 'Germany Operations', 'European manufacturing hub', 'EUR', 'Germany', NULL, '2025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2025-05-20 03:55:35.337909', NULL, '2025-05-20 03:55:35.337909', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (10, 'CN01', 'China Operations', 'Asian production facility', 'CNY', 'China', NULL, '2025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2025-05-20 03:55:35.337909', NULL, '2025-05-20 03:55:35.337909', NULL, 1, NULL);
INSERT INTO public.company_codes VALUES (11, 'UK01', 'United Kingdom Branch', 'UK sales and distribution', 'GBP', 'United Kingdom', NULL, '2025', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2025-05-20 03:55:35.337909', NULL, '2025-05-20 03:55:35.337909', NULL, 1, NULL);


--
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.currencies VALUES (1, 'USD', 'US Dollar', '$', '2', '1.0', true, true, '2025-05-17 14:16:12.170855', '2025-05-17 14:16:12.170855', NULL);
INSERT INTO public.currencies VALUES (2, 'EUR', 'Euro', '€', '2', '1.08', false, true, '2025-05-17 14:16:12.170855', '2025-05-17 14:16:12.170855', NULL);
INSERT INTO public.currencies VALUES (3, 'GBP', 'British Pound', '£', '2', '1.27', false, true, '2025-05-17 14:16:12.170855', '2025-05-17 14:16:12.170855', NULL);
INSERT INTO public.currencies VALUES (4, 'JPY', 'Japanese Yen', '¥', '0', '0.0067', false, true, '2025-05-17 14:16:12.170855', '2025-05-17 14:16:12.170855', NULL);
INSERT INTO public.currencies VALUES (5, 'CNY', 'Chinese Yuan', '¥', '2', '0.138', false, true, '2025-05-17 14:16:12.170855', '2025-05-17 14:16:12.170855', NULL);


--
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.plants VALUES (1, 'P001', 'Main Factory', NULL, 1, 'Manufacturing', 'Production', NULL, 'Chicago', NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, '2025-05-17 13:44:11.172767', NULL, '2025-05-17 13:44:11.172767', NULL, 1, NULL);
INSERT INTO public.plants VALUES (2, 'W001', 'East Coast Warehouse', NULL, 1, 'Warehouse', 'Storage', NULL, 'Newark', NULL, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, '2025-05-17 13:44:11.172767', NULL, '2025-05-17 13:44:11.172767', NULL, 1, NULL);
INSERT INTO public.plants VALUES (3, 'P002', 'European Production', NULL, 2, 'Manufacturing', 'Production', NULL, 'Munich', NULL, 'Germany', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, '2025-05-17 13:44:11.172767', NULL, '2025-05-17 13:44:11.172767', NULL, 1, NULL);
INSERT INTO public.plants VALUES (4, 'p001', 'plant South East', '', 1, 'Warehouse', '', '', '', '', '', '', '', NULL, '', '', '', '', 'active', true, '2025-05-19 22:58:38.372', NULL, '2025-05-19 22:58:38.372', NULL, 1, NULL);
INSERT INTO public.plants VALUES (5, 'P003', 'Berlin Production', 'Berlin Production - manufacturing facility', 2, 'manufacturing', 'production', 'Fabrikstraße 25, Berlin, 10115', NULL, NULL, 'Germany', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, '2025-05-20 04:52:26.251247', NULL, '2025-05-20 04:52:26.251247', NULL, 1, NULL);
INSERT INTO public.plants VALUES (6, 'P004', 'Shanghai Facility', 'Shanghai Facility - manufacturing facility', 10, 'manufacturing', 'production', '100 Industrial Zone, Shanghai, 200000', NULL, NULL, 'China', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, '2025-05-20 04:52:26.305857', NULL, '2025-05-20 04:52:26.305857', NULL, 1, NULL);
INSERT INTO public.plants VALUES (7, 'W002', 'European Warehouse', 'European Warehouse - warehouse facility', 2, 'warehouse', 'distribution', 'Logistikweg 10, Hamburg, 20095', NULL, NULL, 'Germany', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, '2025-05-20 04:52:26.370563', NULL, '2025-05-20 04:52:26.370563', NULL, 1, NULL);
INSERT INTO public.plants VALUES (8, 'W003', 'Asian Distribution Hub', 'Asian Distribution Hub - warehouse facility', 10, 'warehouse', 'distribution', '200 Export Center, Shenzhen, 518000', NULL, NULL, 'China', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, '2025-05-20 04:52:26.417674', NULL, '2025-05-20 04:52:26.417674', NULL, 1, NULL);
INSERT INTO public.plants VALUES (9, 'W004', 'UK Warehouse', 'UK Warehouse - warehouse facility', 11, 'warehouse', 'distribution', '15 Logistics Way, Manchester, M1 1AA', NULL, NULL, 'United Kingdom', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, '2025-05-20 04:52:26.461796', NULL, '2025-05-20 04:52:26.461796', NULL, 1, NULL);


--
-- Data for Name: purchase_organizations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.purchase_organizations VALUES (9, 'PO01', 'US Raw Materials Procurement', 'Purchases raw materials for US manufacturing', 1, 'USD', NULL, NULL, NULL, NULL, true, '2025-05-20 05:01:13.627938', '2025-05-20 05:01:13.627938', NULL, NULL, 1, '2025-05-20', NULL, 'direct', 'production', NULL, NULL, NULL, 'USA', NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (10, 'PO02', 'US MRO Procurement', 'Purchases maintenance supplies for US operations', 1, 'USD', NULL, NULL, NULL, NULL, true, '2025-05-20 05:01:13.677542', '2025-05-20 05:01:13.677542', NULL, NULL, 1, '2025-05-20', NULL, 'indirect', 'maintenance', NULL, NULL, NULL, 'USA', NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (11, 'PO03', 'European Raw Materials', 'Purchases raw materials for European manufacturing', 2, 'EUR', NULL, NULL, NULL, NULL, true, '2025-05-20 05:01:13.705442', '2025-05-20 05:01:13.705442', NULL, NULL, 1, '2025-05-20', NULL, 'direct', 'production', NULL, NULL, NULL, 'Germany', NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (12, 'PO04', 'European Services', 'Purchases services for European operations', 2, 'EUR', NULL, NULL, NULL, NULL, true, '2025-05-20 05:01:13.730688', '2025-05-20 05:01:13.730688', NULL, NULL, 1, '2025-05-20', NULL, 'indirect', 'services', NULL, NULL, NULL, 'Germany', NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (13, 'PO05', 'Asia Pacific Procurement', 'Handles all purchasing activities in APAC region', 10, 'CNY', NULL, NULL, NULL, NULL, true, '2025-05-20 05:01:13.754219', '2025-05-20 05:01:13.754219', NULL, NULL, 1, '2025-05-20', NULL, 'direct', 'production', NULL, NULL, NULL, 'China', NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (14, 'PO06', 'Global Capital Purchases', 'Handles all major capital expenditures globally', 1, 'USD', NULL, NULL, NULL, NULL, true, '2025-05-20 05:01:13.782274', '2025-05-20 05:01:13.782274', NULL, NULL, 1, '2025-05-20', NULL, 'capital', 'equipment', NULL, NULL, NULL, 'USA', NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (15, 'PO07', 'UK Procurement', 'Manages all procurement for UK operations', 11, 'GBP', NULL, NULL, NULL, NULL, true, '2025-05-20 05:01:13.801961', '2025-05-20 05:01:13.801961', NULL, NULL, 1, '2025-05-20', NULL, 'direct', 'production', NULL, NULL, NULL, 'United Kingdom', NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (16, 'PO08', 'Canada Procurement', 'Handles all purchasing for Canadian operations', 5, 'CAD', NULL, NULL, NULL, NULL, true, '2025-05-20 05:01:13.825862', '2025-05-20 05:01:13.825862', NULL, NULL, 1, '2025-05-20', NULL, 'direct', 'production', NULL, NULL, NULL, 'Canada', NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (17, 'NA01', 'North America Procurement', NULL, 1, 'USD', NULL, NULL, NULL, NULL, true, '2025-05-20 21:43:20.089848', '2025-05-20 21:43:20.089848', NULL, NULL, 1, '2025-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (18, 'EU01', 'European Procurement', NULL, 9, 'EUR', NULL, NULL, NULL, NULL, true, '2025-05-20 21:43:20.111292', '2025-05-20 21:43:20.111292', NULL, NULL, 1, '2025-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (19, 'UK01', 'UK Procurement', NULL, 11, 'GBP', NULL, NULL, NULL, NULL, true, '2025-05-20 21:43:20.128029', '2025-05-20 21:43:20.128029', NULL, NULL, 1, '2025-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (22, 'IN01', 'India Purchasing', NULL, 6, 'INR', NULL, NULL, NULL, NULL, true, '2025-05-20 21:43:20.460685', '2025-05-20 21:43:20.460685', NULL, NULL, 1, '2025-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL);
INSERT INTO public.purchase_organizations VALUES (24, 'GLOB', 'Global Procurement', NULL, 1, 'USD', NULL, NULL, NULL, NULL, true, '2025-05-20 21:43:20.621543', '2025-05-20 21:43:20.621543', NULL, NULL, 1, '2025-05-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'admin', 'admin123', 'Administrator', 'admin@example.com', 'admin', '2025-05-17 05:55:13.089835', '2025-05-17 05:55:13.089835');


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.vendors VALUES (1, 'VEND001', 'Global Raw Materials Inc', 'SUPPLIER', NULL, '123-45-6789', NULL, '100 Supplier Road, Chicago, IL 60601', NULL, NULL, 'US', NULL, NULL, '+1-312-555-1234', NULL, 'sales@grm.example.com', NULL, NULL, 'NET30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', false, NULL, 'Primary raw material supplier', NULL, NULL, true, '2025-05-20 18:17:22.279989', '2025-05-20 18:17:22.279989', NULL, NULL, 1);
INSERT INTO public.vendors VALUES (2, 'VEND002', 'European Components GmbH', 'MANUFACTURER', NULL, 'DE123456789', NULL, 'Industrieweg 10, Munich, 80331', NULL, NULL, 'DE', NULL, NULL, '+49-89-1234-5678', NULL, 'orders@eurocomponents.example.de', NULL, NULL, 'NET45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', false, NULL, 'European electronics components supplier', NULL, NULL, true, '2025-05-20 18:17:22.301591', '2025-05-20 18:17:22.301591', NULL, NULL, 1);
INSERT INTO public.vendors VALUES (3, 'VEND003', 'Asian Electronics Ltd', 'MANUFACTURER', NULL, 'SG987654321', NULL, '1 Electronics Way, Singapore, 618989', NULL, NULL, 'SG', NULL, NULL, '+65-6789-1234', NULL, 'sales@asianelec.example.sg', NULL, NULL, 'NET30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', false, NULL, 'Electronics components supplier', NULL, NULL, true, '2025-05-20 18:17:22.320725', '2025-05-20 18:17:22.320725', NULL, NULL, 1);
INSERT INTO public.vendors VALUES (4, 'VEND004', 'Quality Packaging Ltd', 'SUPPLIER', NULL, 'GB123456789', NULL, '10 Packaging Street, Manchester, M1 1AA', NULL, NULL, 'GB', NULL, NULL, '+44-161-123-4567', NULL, 'sales@qualitypack.example.uk', NULL, NULL, 'NET30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', false, NULL, 'Packaging materials supplier', NULL, NULL, true, '2025-05-20 18:17:22.341416', '2025-05-20 18:17:22.341416', NULL, NULL, 1);
INSERT INTO public.vendors VALUES (5, 'VEND005', 'Japan Precision Tools', 'MANUFACTURER', NULL, 'JP1234567890', NULL, '2-1 Industrial Area, Osaka, 530-0001', NULL, NULL, 'JP', NULL, NULL, '+81-6-1234-5678', NULL, 'export@jpt.example.jp', NULL, NULL, 'NET15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', false, NULL, 'Precision tools manufacturer', NULL, NULL, true, '2025-05-20 18:17:22.360311', '2025-05-20 18:17:22.360311', NULL, NULL, 1);


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.purchase_orders VALUES (1, 'PO-2025-001', 1, NULL, NULL, NULL, '2025-06-01', '2025-06-15', NULL, NULL, 1.0000, 25000.00, NULL, NULL, NULL, 'Approved', 1, NULL, NULL, NULL, '2025-06-04 01:15:06.542271', '2025-06-04 01:15:06.542271');
INSERT INTO public.purchase_orders VALUES (2, 'PO-2025-002', 2, NULL, NULL, NULL, '2025-06-02', '2025-06-20', NULL, NULL, 1.0000, 18500.00, NULL, NULL, NULL, 'Pending', 1, NULL, NULL, NULL, '2025-06-04 01:15:06.542271', '2025-06-04 01:15:06.542271');
INSERT INTO public.purchase_orders VALUES (3, 'PO-2025-003', 3, NULL, NULL, NULL, '2025-06-03', '2025-06-25', NULL, NULL, 1.0000, 42000.00, NULL, NULL, NULL, 'Draft', 1, NULL, NULL, NULL, '2025-06-04 01:15:06.542271', '2025-06-04 01:15:06.542271');
INSERT INTO public.purchase_orders VALUES (4, 'PO-2025-004', 1, NULL, NULL, NULL, '2025-06-04', '2025-06-30', NULL, NULL, 1.0000, 15750.00, NULL, NULL, NULL, 'Approved', 1, NULL, NULL, NULL, '2025-06-04 01:15:06.542271', '2025-06-04 01:15:06.542271');
INSERT INTO public.purchase_orders VALUES (5, 'PO-2025-005', 2, NULL, NULL, NULL, '2025-06-05', '2025-07-05', NULL, NULL, 1.0000, 33200.00, NULL, NULL, NULL, 'Pending', 1, NULL, NULL, NULL, '2025-06-04 01:15:06.542271', '2025-06-04 01:15:06.542271');


--
-- Data for Name: accounts_payable; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accounts_payable VALUES (1, 1, 'AP000001', '2025-05-30', '2025-06-24', 47838.36, 1, 1, 1, NULL, 'Net 60', 'Paid', NULL, NULL, 0.00, 0.00, 5567.37, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (2, 1, 'AP000002', '2025-03-31', '2025-06-22', 9250.10, 1, 2, 1, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 42812.95, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (3, 1, 'AP000003', '2025-05-22', '2025-07-01', 32224.00, 1, 1, 2, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 3820.84, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (4, 1, 'AP000004', '2025-03-22', '2025-06-24', 22337.39, 1, 2, 2, NULL, 'Net 60', 'Paid', NULL, NULL, 0.00, 0.00, 13850.49, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (5, 2, 'AP000005', '2025-04-08', '2025-06-10', 14588.97, 1, 1, 1, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 20777.60, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (6, 2, 'AP000006', '2025-05-11', '2025-06-11', 21228.90, 1, 2, 1, NULL, 'Net 60', 'Open', NULL, NULL, 0.00, 0.00, 5461.03, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (7, 2, 'AP000007', '2025-05-07', '2025-06-10', 4409.29, 1, 1, 2, NULL, 'Net 60', 'Paid', NULL, NULL, 0.00, 0.00, 31608.47, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (8, 2, 'AP000008', '2025-06-01', '2025-06-14', 35983.42, 1, 2, 2, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 36771.91, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (9, 3, 'AP000009', '2025-03-25', '2025-06-14', 13713.36, 1, 1, 1, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 9380.00, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (10, 3, 'AP000010', '2025-05-22', '2025-06-22', 17510.14, 1, 2, 1, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 9086.99, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (11, 3, 'AP000011', '2025-03-22', '2025-06-29', 12341.88, 1, 1, 2, NULL, '2/10 Net 30', 'Open', NULL, NULL, 0.00, 0.00, 44419.24, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (12, 3, 'AP000012', '2025-05-29', '2025-06-27', 6162.53, 1, 2, 2, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 45212.87, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (13, 4, 'AP000013', '2025-05-24', '2025-06-17', 6752.22, 1, 1, 1, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 31644.39, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (14, 4, 'AP000014', '2025-05-02', '2025-06-28', 45753.24, 1, 2, 1, NULL, '2/10 Net 30', 'Open', NULL, NULL, 0.00, 0.00, 2142.99, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (15, 4, 'AP000015', '2025-05-29', '2025-06-21', 27214.71, 1, 1, 2, NULL, 'Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 12299.88, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (16, 4, 'AP000016', '2025-03-26', '2025-06-30', 7709.25, 1, 2, 2, NULL, 'Net 60', 'Open', NULL, NULL, 0.00, 0.00, 28709.80, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (17, 5, 'AP000017', '2025-06-03', '2025-06-16', 37654.25, 1, 1, 1, NULL, 'Net 60', 'Paid', NULL, NULL, 0.00, 0.00, 1122.16, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (18, 5, 'AP000018', '2025-03-15', '2025-06-22', 23692.87, 1, 2, 1, NULL, 'Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 23897.81, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (19, 5, 'AP000019', '2025-03-17', '2025-06-21', 20784.48, 1, 1, 2, NULL, 'Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 23198.00, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');
INSERT INTO public.accounts_payable VALUES (20, 5, 'AP000020', '2025-05-29', '2025-06-26', 16975.29, 1, 2, 2, NULL, '2/10 Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 3105.77, NULL, 1, '2025-06-04 00:44:42.884195', '2025-06-04 00:44:42.884195');


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customers VALUES (1, 'Acme Corporation', 'orders@acme.example.com', '+1-212-555-0123', '123 Main Street, New York, NY 10001', 'Key account - has special pricing agreement', NULL, '2025-05-20 18:17:22.106429', '2025-05-20 18:17:22.106429');
INSERT INTO public.customers VALUES (2, 'Global Enterprises', 'procurement@globalent.example.com', '+1-312-555-0456', '456 Park Avenue, Chicago, IL 60601', 'High volume customer', NULL, '2025-05-20 18:17:22.140573', '2025-05-20 18:17:22.140573');
INSERT INTO public.customers VALUES (3, 'European Distributors Ltd', 'orders@eurodist.example.com', '+44-20-7123-4567', '1 Oxford Street, London, W1D 1BS', 'European distribution partner', NULL, '2025-05-20 18:17:22.160991', '2025-05-20 18:17:22.160991');
INSERT INTO public.customers VALUES (4, 'Tech Solutions GmbH', 'einkauf@techsolutions.example.de', '+49-30-1234-5678', 'Hauptstraße 1, Berlin, 10115', 'German tech industry client', NULL, '2025-05-20 18:17:22.179183', '2025-05-20 18:17:22.179183');
INSERT INTO public.customers VALUES (5, 'Japan Manufacturing Co.', 'orders@japanmfg.example.jp', '+81-3-1234-5678', '1-1 Marunouchi, Tokyo, 100-0005', 'Japanese manufacturing partner', NULL, '2025-05-20 18:17:22.197684', '2025-05-20 18:17:22.197684');


--
-- Data for Name: sales_organizations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_organizations VALUES (8, 'SO01', 'US Consumer Retail', 'Manages US retail consumer sales', 1, 'USD', 'North America', 'retail', 'consumer', NULL, NULL, NULL, 'USA', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:13.871186+00', NULL, '2025-05-20 05:01:13.871186+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (9, 'SO02', 'US B2B Sales', 'Handles direct business-to-business sales in US', 1, 'USD', 'North America', 'direct', 'industrial', NULL, NULL, NULL, 'USA', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:13.903811+00', NULL, '2025-05-20 05:01:13.903811+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (10, 'SO03', 'US eCommerce', 'Manages all online sales channels in US', 1, 'USD', 'North America', 'online', 'consumer', NULL, NULL, NULL, 'USA', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:13.923177+00', NULL, '2025-05-20 05:01:13.923177+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (11, 'SO04', 'European Retail', 'Manages European retail sales operations', 2, 'EUR', 'EMEA', 'retail', 'consumer', NULL, NULL, NULL, 'Germany', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:13.949517+00', NULL, '2025-05-20 05:01:13.949517+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (12, 'SO05', 'European Wholesale', 'Handles wholesale distribution in Europe', 2, 'EUR', 'EMEA', 'wholesale', 'industrial', NULL, NULL, NULL, 'Germany', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:13.967276+00', NULL, '2025-05-20 05:01:13.967276+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (13, 'SO06', 'China Retail', 'Manages retail sales operations in China', 10, 'CNY', 'APAC', 'retail', 'consumer', NULL, NULL, NULL, 'China', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:13.98566+00', NULL, '2025-05-20 05:01:13.98566+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (14, 'SO07', 'APAC Distribution', 'Handles distribution across Asia Pacific region', 10, 'CNY', 'APAC', 'wholesale', 'mixed', NULL, NULL, NULL, 'China', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:14.008718+00', NULL, '2025-05-20 05:01:14.008718+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (15, 'SO08', 'UK Consumer Sales', 'Manages retail consumer sales in UK', 11, 'GBP', 'EMEA', 'retail', 'consumer', NULL, NULL, NULL, 'United Kingdom', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:14.03034+00', NULL, '2025-05-20 05:01:14.03034+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (16, 'SO09', 'Canada Sales', 'Handles all sales operations in Canada', 5, 'CAD', 'North America', 'mixed', 'mixed', NULL, NULL, NULL, 'Canada', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 05:01:14.049053+00', NULL, '2025-05-20 05:01:14.049053+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (17, 'US01', 'US East Sales', NULL, 1, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 'US', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 21:43:19.29688+00', NULL, '2025-05-20 21:43:19.29688+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (19, 'CA01', 'Canada Sales', NULL, 5, 'CAD', NULL, NULL, NULL, NULL, NULL, NULL, 'CA', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 21:43:19.477648+00', NULL, '2025-05-20 21:43:19.477648+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (20, 'UK01', 'UK Sales Division', NULL, 11, 'GBP', NULL, NULL, NULL, NULL, NULL, NULL, 'GB', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 21:43:19.499825+00', NULL, '2025-05-20 21:43:19.499825+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (21, 'EU01', 'European Sales', NULL, 9, 'EUR', NULL, NULL, NULL, NULL, NULL, NULL, 'EU', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 21:43:19.51623+00', NULL, '2025-05-20 21:43:19.51623+00', NULL, 1);
INSERT INTO public.sales_organizations VALUES (24, 'IN01', 'India Sales Division', NULL, 6, 'INR', NULL, NULL, NULL, NULL, NULL, NULL, 'IN', NULL, NULL, NULL, NULL, 'active', true, NULL, '2025-05-20 21:43:19.889334+00', NULL, '2025-05-20 21:43:19.889334+00', NULL, 1);


--
-- Data for Name: sales_orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_orders VALUES (1, 'SO-2025-1001', 1, 'TechNova Inc', '2025-05-10 02:19:58.867513+00', '2025-05-30 02:19:58.867513+00', 'Confirmed', 5649.75, 'Paid', '123 Tech Park, San Francisco, CA', '123 Tech Park, San Francisco, CA', NULL, NULL, '2025-05-23 02:19:58.867513+00', '2025-05-23 02:19:58.867513+00', 1, 8, 1, NULL);
INSERT INTO public.sales_orders VALUES (2, 'SO-2025-1002', 2, 'Elevate Solutions', '2025-05-12 02:19:58.867513+00', '2025-05-28 02:19:58.867513+00', 'Processing', 2375.50, 'Paid', '456 Business Ave, Seattle, WA', '456 Business Ave, Seattle, WA', NULL, NULL, '2025-05-23 02:19:58.867513+00', '2025-05-23 02:19:58.867513+00', 1, 8, 1, NULL);
INSERT INTO public.sales_orders VALUES (3, 'SO-2025-1003', 3, 'DataWave Analytics', '2025-05-15 02:19:58.867513+00', '2025-06-02 02:19:58.867513+00', 'Processing', 8925.33, 'Partial', '789 Data Drive, Boston, MA', '789 Data Drive, Boston, MA', NULL, NULL, '2025-05-23 02:19:58.867513+00', '2025-05-23 02:19:58.867513+00', 1, 8, 1, NULL);
INSERT INTO public.sales_orders VALUES (4, 'SO-2025-1004', 4, 'Quantum Systems', '2025-05-18 02:19:58.867513+00', '2025-06-06 02:19:58.867513+00', 'Pending', 3450.20, 'Unpaid', '101 Quantum Blvd, Austin, TX', '101 Quantum Blvd, Austin, TX', NULL, NULL, '2025-05-23 02:19:58.867513+00', '2025-05-23 02:19:58.867513+00', 1, 8, 1, NULL);
INSERT INTO public.sales_orders VALUES (5, 'SO-2025-1005', 5, 'Arctic Innovations', '2025-05-20 02:19:58.867513+00', '2025-05-30 02:19:58.867513+00', 'Confirmed', 1875.60, 'Paid', '202 Ice Street, Chicago, IL', '202 Ice Street, Chicago, IL', NULL, NULL, '2025-05-23 02:19:58.867513+00', '2025-05-23 02:19:58.867513+00', 1, 8, 1, NULL);


--
-- Data for Name: accounts_receivable; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.accounts_receivable VALUES (1, 1, 'AR000001', '2025-04-09', '2025-07-08', 45565.28, 1, 1, 1, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 96575.56, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (2, 2, 'AR000002', '2025-05-05', '2025-06-30', 70579.07, 1, 1, 1, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 53968.12, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (3, 3, 'AR000003', '2025-05-16', '2025-06-29', 90806.55, 1, 1, 1, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 7895.64, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (4, 4, 'AR000004', '2025-06-03', '2025-07-09', 53773.31, 1, 1, 1, NULL, 'Net 45', 'Paid', NULL, NULL, 0.00, 0.00, 31983.21, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (5, 5, 'AR000005', '2025-04-14', '2025-06-17', 14521.86, 1, 1, 1, NULL, 'Net 30', 'Paid', NULL, NULL, 0.00, 0.00, 76067.68, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (6, 1, 'AR000006', '2025-04-27', '2025-07-09', 88330.44, 1, 2, 1, NULL, 'Net 60', 'Paid', NULL, NULL, 0.00, 0.00, 72908.98, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (7, 2, 'AR000007', '2025-05-14', '2025-07-07', 9146.44, 1, 2, 1, NULL, 'Net 30', 'Overdue', NULL, NULL, 0.00, 0.00, 41336.64, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (8, 3, 'AR000008', '2025-05-28', '2025-06-16', 42630.56, 1, 2, 1, NULL, 'Net 45', 'Open', NULL, NULL, 0.00, 0.00, 39717.42, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (9, 4, 'AR000009', '2025-05-24', '2025-07-04', 69552.52, 1, 2, 1, NULL, 'Net 60', 'Paid', NULL, NULL, 0.00, 0.00, 48387.89, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (10, 5, 'AR000010', '2025-04-17', '2025-06-22', 15146.02, 1, 2, 1, NULL, 'Net 60', 'Open', NULL, NULL, 0.00, 0.00, 97124.72, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (11, 1, 'AR000011', '2025-05-11', '2025-06-09', 22085.06, 1, 1, 2, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 65227.88, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (12, 2, 'AR000012', '2025-05-02', '2025-06-20', 28185.91, 1, 1, 2, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 74679.11, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (13, 3, 'AR000013', '2025-04-09', '2025-06-21', 16533.58, 1, 1, 2, NULL, 'Net 45', 'Overdue', NULL, NULL, 0.00, 0.00, 85472.65, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (14, 4, 'AR000014', '2025-06-02', '2025-06-26', 42584.48, 1, 1, 2, NULL, 'Net 45', 'Paid', NULL, NULL, 0.00, 0.00, 14340.11, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (15, 5, 'AR000015', '2025-05-24', '2025-06-06', 7901.24, 1, 1, 2, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 81366.85, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (16, 1, 'AR000016', '2025-04-22', '2025-06-22', 16068.79, 1, 2, 2, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 15011.23, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (17, 2, 'AR000017', '2025-04-20', '2025-07-16', 52841.49, 1, 2, 2, NULL, 'Net 45', 'Paid', NULL, NULL, 0.00, 0.00, 25781.58, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (18, 3, 'AR000018', '2025-05-29', '2025-06-07', 9468.52, 1, 2, 2, NULL, 'Net 45', 'Overdue', NULL, NULL, 0.00, 0.00, 86568.69, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (19, 4, 'AR000019', '2025-05-31', '2025-06-30', 99156.13, 1, 2, 2, NULL, 'Net 45', 'Open', NULL, NULL, 0.00, 0.00, 31387.58, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (20, 5, 'AR000020', '2025-05-03', '2025-07-13', 52978.43, 1, 2, 2, NULL, 'Net 30', 'Open', NULL, NULL, 0.00, 0.00, 16317.79, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (21, 1, 'AR000021', '2025-05-13', '2025-06-09', 6883.61, 2, 1, 1, NULL, 'Net 45', 'Paid', NULL, NULL, 0.00, 0.00, 16939.39, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (22, 2, 'AR000022', '2025-05-06', '2025-07-09', 63651.40, 2, 1, 1, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 56058.37, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (23, 3, 'AR000023', '2025-04-18', '2025-06-24', 88658.27, 2, 1, 1, NULL, 'Net 30', 'Overdue', NULL, NULL, 0.00, 0.00, 25210.15, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (24, 4, 'AR000024', '2025-04-09', '2025-06-04', 50958.76, 2, 1, 1, NULL, 'Net 30', 'Overdue', NULL, NULL, 0.00, 0.00, 72221.26, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');
INSERT INTO public.accounts_receivable VALUES (25, 5, 'AR000025', '2025-04-06', '2025-07-06', 78462.86, 2, 1, 1, NULL, 'Net 60', 'Overdue', NULL, NULL, 0.00, 0.00, 38983.94, NULL, 1, '2025-06-04 00:44:46.291765', '2025-06-04 00:44:46.291765');


--
-- Data for Name: activity_types; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.activity_types VALUES (1, 'MACH-HR', 'Machine Hours', 'HR', 'MACHINE', 'US01', NULL, '2025-06-03 17:58:50.654812');
INSERT INTO public.activity_types VALUES (2, 'LABOR-HR', 'Labor Hours', 'HR', 'LABOR', 'US01', NULL, '2025-06-03 17:58:50.654812');
INSERT INTO public.activity_types VALUES (3, 'SETUP-HR', 'Setup Hours', 'HR', 'SETUP', 'US01', NULL, '2025-06-03 17:58:50.654812');
INSERT INTO public.activity_types VALUES (4, 'QC-HR', 'Quality Control Hours', 'HR', 'QUALITY', 'US01', NULL, '2025-06-03 17:58:50.654812');
INSERT INTO public.activity_types VALUES (5, 'MAINT-HR', 'Maintenance Hours', 'HR', 'MAINTENANCE', 'US01', NULL, '2025-06-03 17:58:50.654812');


--
-- Data for Name: ai_agent_configs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ai_agent_configs VALUES (1, 'masterData', 'Master Data Management', 'Master Data Specialist', 'Expert in organizational structures, material management, customer/vendor data, and reference data maintenance', 'You are a Master Data Management specialist with deep expertise in Enterprise-standard organizational structures and reference data. You help users navigate complex master data relationships, ensure data integrity, and optimize organizational hierarchies. You understand the critical importance of accurate master data for all business processes.', '["Organizational Structures", "Material Master", "Customer Master", "Vendor Master", "Chart of Accounts", "Cost Centers", "Profit Centers", "Plant Maintenance", "Units of Measure", "Number Ranges", "Data Governance"]', '["Data Structure Analysis", "Master Data Creation Guidance", "Organizational Hierarchy Design", "Data Quality Assessment", "Reference Data Management", "Integration Mapping", "Compliance Checking", "Migration Planning"]', true, '2025-06-04 04:33:55.202225+00', '2025-06-04 04:33:55.202225+00');
INSERT INTO public.ai_agent_configs VALUES (2, 'sales', 'Sales Management', 'Sales Operations Expert', 'Specialist in sales processes, customer relationship management, pricing strategies, and revenue optimization', 'You are a Sales Operations expert with comprehensive knowledge of sales processes, customer lifecycle management, and revenue optimization strategies. You help users maximize sales performance, improve customer relationships, and streamline sales operations from lead generation to order fulfillment.', '["Lead Management", "Opportunity Tracking", "Quote Generation", "Order Processing", "Customer Relationship Management", "Sales Analytics", "Pricing Strategies", "Sales Forecasting", "Territory Management", "Commission Management"]', '["Sales Process Optimization", "Lead Qualification", "Revenue Analysis", "Customer Segmentation", "Sales Performance Metrics", "Pipeline Management", "Pricing Strategy", "Sales Forecasting"]', true, '2025-06-04 04:34:02.73724+00', '2025-06-04 04:34:02.73724+00');
INSERT INTO public.ai_agent_configs VALUES (3, 'inventory', 'Inventory Management', 'Inventory Control Specialist', 'Expert in stock management, warehouse operations, material movements, and inventory optimization', 'You are an Inventory Management specialist with deep knowledge of stock control, warehouse operations, and supply chain optimization. You help users maintain optimal inventory levels, reduce carrying costs, and ensure material availability for production and sales.', '["Stock Management", "Warehouse Operations", "Material Movements", "Inventory Valuation", "ABC Analysis", "Cycle Counting", "Safety Stock Planning", "Demand Forecasting", "Supplier Management", "Inventory Optimization"]', '["Stock Level Analysis", "Inventory Turnover Optimization", "Demand Planning", "Warehouse Layout Design", "Material Flow Analysis", "Cost Reduction Strategies", "Supply Chain Optimization", "Inventory Reporting"]', true, '2025-06-04 04:34:14.229792+00', '2025-06-04 04:34:14.229792+00');
INSERT INTO public.ai_agent_configs VALUES (4, 'purchase', 'Purchase Management', 'Procurement Specialist', 'Expert in procurement processes, vendor management, sourcing strategies, and purchase optimization', 'You are a Procurement specialist with extensive experience in strategic sourcing, vendor management, and purchase process optimization. You help users achieve cost savings, ensure supply security, and maintain high-quality supplier relationships.', '["Strategic Sourcing", "Vendor Management", "Purchase Requisitions", "Purchase Orders", "Contract Management", "Supplier Evaluation", "Cost Analysis", "Procurement Analytics", "Risk Management", "Compliance"]', '["Sourcing Strategy Development", "Vendor Performance Analysis", "Cost Optimization", "Contract Negotiation Support", "Supplier Risk Assessment", "Procurement Process Improvement", "Spend Analysis", "Market Research"]', true, '2025-06-04 04:34:14.229792+00', '2025-06-04 04:34:14.229792+00');
INSERT INTO public.ai_agent_configs VALUES (5, 'production', 'Production Management', 'Manufacturing Operations Expert', 'Specialist in production planning, manufacturing execution, quality control, and operational efficiency', 'You are a Manufacturing Operations expert with comprehensive knowledge of production planning, shop floor management, and manufacturing excellence. You help users optimize production processes, improve quality, and maximize operational efficiency.', '["Production Planning", "Manufacturing Execution", "Quality Control", "Capacity Planning", "Bill of Materials", "Work Center Management", "Shop Floor Control", "Lean Manufacturing", "Equipment Maintenance", "Performance Monitoring"]', '["Production Schedule Optimization", "Capacity Analysis", "Quality Improvement", "Process Optimization", "Equipment Efficiency", "Bottleneck Analysis", "Cost Reduction", "Performance Metrics"]', true, '2025-06-04 04:34:14.229792+00', '2025-06-04 04:34:14.229792+00');
INSERT INTO public.ai_agent_configs VALUES (6, 'finance', 'Finance Management', 'Financial Operations Expert', 'Expert in financial accounting, treasury management, accounts payable/receivable, and financial reporting', 'You are a Financial Operations expert with deep knowledge of accounting principles, financial processes, and regulatory compliance. You help users manage financial transactions, optimize cash flow, and ensure accurate financial reporting.', '["General Ledger", "Accounts Payable", "Accounts Receivable", "Asset Accounting", "Bank Management", "Financial Reporting", "Tax Management", "Compliance", "Cash Flow Management", "Financial Analysis"]', '["Financial Process Optimization", "Cash Flow Analysis", "Financial Reporting", "Compliance Monitoring", "Risk Assessment", "Budget Analysis", "Financial Performance Metrics", "Audit Support"]', true, '2025-06-04 04:34:23.866021+00', '2025-06-04 04:34:23.866021+00');
INSERT INTO public.ai_agent_configs VALUES (7, 'controlling', 'Controlling', 'Management Accounting Specialist', 'Specialist in cost accounting, profitability analysis, budgeting, and management reporting', 'You are a Management Accounting specialist with expertise in cost control, profitability analysis, and performance management. You help users understand cost structures, analyze profitability, and make data-driven business decisions.', '["Cost Center Accounting", "Profit Center Accounting", "Product Costing", "Profitability Analysis", "Budget Planning", "Variance Analysis", "Activity-Based Costing", "Performance Management", "Management Reporting", "Business Intelligence"]', '["Cost Analysis", "Profitability Assessment", "Budget Planning", "Variance Analysis", "Performance Monitoring", "Cost Optimization", "Management Reporting", "Business Intelligence"]', true, '2025-06-04 04:34:23.866021+00', '2025-06-04 04:34:23.866021+00');


--
-- Data for Name: ai_agent_analytics; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: ai_agent_health; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: ai_chat_sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: ai_chat_messages; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: ai_data_analysis_sessions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.api_keys VALUES (1, 'openai', 'OPENAI_API_KEY', 'c2stcHJvai0ybVVsOVJleFQ4Z3B2TXAtSkJLMXI3RTlhR0xyd050RXk1Wk41V3YwYWNPX1h0eURfY3B4WU1rWWwzUFh3Y3MybmwxQ0hFYnRuMFQzQmxia0ZKQUM1QWV1OFZjXzFHb3R5bEh3aHY0TjBfTXMyLTc2ZHFtMVV5T3BHSFh1d1RWdVVZS0F4Y2lEcGljb0d0RDlnZGJ4TEtDV25Gc0E=', 'OpenAI API key for AI agent functionality', true, '2025-06-04 13:29:59.56228+00', '2025-06-04 13:34:44.013221+00', NULL);


--
-- Data for Name: approval_levels; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.approval_levels VALUES (1, 1, 'Team Lead', 'First level approval - up to $5,000', 5000.00, '2025-05-20 22:09:21.912924', '2025-05-20 22:09:21.912924');
INSERT INTO public.approval_levels VALUES (2, 2, 'Department Manager', 'Second level approval - up to $25,000', 25000.00, '2025-05-20 22:09:21.912924', '2025-05-20 22:09:21.912924');
INSERT INTO public.approval_levels VALUES (3, 3, 'Director', 'Third level approval - up to $100,000', 100000.00, '2025-05-20 22:09:21.912924', '2025-05-20 22:09:21.912924');
INSERT INTO public.approval_levels VALUES (4, 4, 'VP', 'Fourth level approval - up to $500,000', 500000.00, '2025-05-20 22:09:21.912924', '2025-05-20 22:09:21.912924');
INSERT INTO public.approval_levels VALUES (5, 5, 'CFO', 'Fifth level approval - unlimited', NULL, '2025-05-20 22:09:21.912924', '2025-05-20 22:09:21.912924');
INSERT INTO public.approval_levels VALUES (6, 1, 'Solutions', '', 500.00, '2025-05-21 01:42:12.929446', '2025-05-21 01:42:12.929446');
INSERT INTO public.approval_levels VALUES (7, 1, 'Team Lead Approval', 'First level approval for small purchases', 1000.00, '2025-05-21 15:12:43.075801', '2025-05-21 15:12:43.075801');
INSERT INTO public.approval_levels VALUES (8, 2, 'Manager Approval', 'Second level approval for medium purchases', 10000.00, '2025-05-21 15:12:43.075801', '2025-05-21 15:12:43.075801');
INSERT INTO public.approval_levels VALUES (9, 3, 'Director Approval', 'Third level approval for large purchases', 50000.00, '2025-05-21 15:12:43.075801', '2025-05-21 15:12:43.075801');
INSERT INTO public.approval_levels VALUES (10, 4, 'Executive Approval', 'Fourth level approval for very large purchases', 250000.00, '2025-05-21 15:12:43.075801', '2025-05-21 15:12:43.075801');
INSERT INTO public.approval_levels VALUES (11, 5, 'Board Approval', 'Highest level approval for major expenditures', 1000000.00, '2025-05-21 15:12:43.075801', '2025-05-21 15:12:43.075801');


--
-- Data for Name: asset_master; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.asset_master VALUES (1, 'A10001', 'CNC Machine - Haas VF-2', 'Vertical machining center', 'MACHINERY', '2019-03-15', 85000.00, 65000.00, 'STRAIGHT_LINE', 10, 1, NULL, 'Plant NY - Building A', 'ACTIVE', true, '2025-05-20 22:11:02.428858', '2025-05-20 22:11:02.428858');
INSERT INTO public.asset_master VALUES (2, 'A10002', 'Forklift - Toyota 8FGCU25', 'Material handling equipment', 'EQUIPMENT', '2019-05-01', 28000.00, 21000.00, 'STRAIGHT_LINE', 7, 1, NULL, 'Plant NY - Warehouse', 'ACTIVE', true, '2025-05-20 22:11:02.428858', '2025-05-20 22:11:02.428858');
INSERT INTO public.asset_master VALUES (3, 'A10003', 'Injection Molding Machine - Engel', 'Plastic injection molding', 'MACHINERY', '2019-08-15', 120000.00, 96000.00, 'STRAIGHT_LINE', 12, 1, NULL, 'Plant NY - Building B', 'ACTIVE', true, '2025-05-20 22:11:02.428858', '2025-05-20 22:11:02.428858');
INSERT INTO public.asset_master VALUES (4, 'A10004', 'Server System - Dell PowerEdge', 'Data center servers', 'IT_EQUIPMENT', '2020-01-10', 45000.00, 27000.00, 'ACCELERATED', 5, 1, NULL, 'NY Headquarters - Server Room', 'ACTIVE', true, '2025-05-20 22:11:02.428858', '2025-05-20 22:11:02.428858');
INSERT INTO public.asset_master VALUES (5, 'A10005', 'Office Building - NY HQ', 'Main office building', 'REAL_ESTATE', '2015-11-30', 3500000.00, 3200000.00, 'STRAIGHT_LINE', 40, 1, NULL, 'Manhattan, NY', 'ACTIVE', true, '2025-05-20 22:11:02.428858', '2025-05-20 22:11:02.428858');
INSERT INTO public.asset_master VALUES (6, 'CN01-AST001', 'Production Machinery #1', 'Heavy-duty manufacturing equipment for main production line', 'MACHINERY', '2022-05-15', 125000.00, 110000.00, 'STRAIGHT_LINE', 10, 10, 9, 'Main Factory Floor', 'ACTIVE', true, '2025-05-21 15:11:52.062215', '2025-05-21 15:11:52.062215');
INSERT INTO public.asset_master VALUES (7, 'DE01-AST001', 'Production Machinery #1', 'Heavy-duty manufacturing equipment for main production line', 'MACHINERY', '2022-05-15', 125000.00, 110000.00, 'STRAIGHT_LINE', 10, 9, 5, 'Main Factory Floor', 'ACTIVE', true, '2025-05-21 15:11:52.062215', '2025-05-21 15:11:52.062215');
INSERT INTO public.asset_master VALUES (8, 'IN01-AST001', 'Production Machinery #1', 'Heavy-duty manufacturing equipment for main production line', 'MACHINERY', '2022-05-15', 125000.00, 110000.00, 'STRAIGHT_LINE', 10, 6, 14, 'Main Factory Floor', 'ACTIVE', true, '2025-05-21 15:11:52.062215', '2025-05-21 15:11:52.062215');
INSERT INTO public.asset_master VALUES (9, 'GA01-AST001', 'Production Machinery #1', 'Heavy-duty manufacturing equipment for main production line', 'MACHINERY', '2022-05-15', 125000.00, 110000.00, 'STRAIGHT_LINE', 10, 7, 15, 'Main Factory Floor', 'ACTIVE', true, '2025-05-21 15:11:52.062215', '2025-05-21 15:11:52.062215');
INSERT INTO public.asset_master VALUES (10, 'UK01-AST001', 'Production Machinery #1', 'Heavy-duty manufacturing equipment for main production line', 'MACHINERY', '2022-05-15', 125000.00, 110000.00, 'STRAIGHT_LINE', 10, 11, 6, 'Main Factory Floor', 'ACTIVE', true, '2025-05-21 15:11:52.062215', '2025-05-21 15:11:52.062215');
INSERT INTO public.asset_master VALUES (11, 'TEST02-AST002', 'Company Vehicle #1', 'Executive transportation vehicle', 'VEHICLES', '2021-10-01', 45000.00, 33750.00, 'DECLINING_BALANCE', 5, 4, 8, 'Corporate Garage', 'ACTIVE', true, '2025-05-21 15:12:00.81308', '2025-05-21 15:12:00.81308');
INSERT INTO public.asset_master VALUES (12, 'DE01-AST002', 'Company Vehicle #1', 'Executive transportation vehicle', 'VEHICLES', '2021-10-01', 45000.00, 33750.00, 'DECLINING_BALANCE', 5, 9, 5, 'Corporate Garage', 'ACTIVE', true, '2025-05-21 15:12:00.81308', '2025-05-21 15:12:00.81308');
INSERT INTO public.asset_master VALUES (13, 'CA01-AST002', 'Company Vehicle #1', 'Executive transportation vehicle', 'VEHICLES', '2021-10-01', 45000.00, 33750.00, 'DECLINING_BALANCE', 5, 5, 13, 'Corporate Garage', 'ACTIVE', true, '2025-05-21 15:12:00.81308', '2025-05-21 15:12:00.81308');
INSERT INTO public.asset_master VALUES (14, 'US01-AST002', 'Company Vehicle #1', 'Executive transportation vehicle', 'VEHICLES', '2021-10-01', 45000.00, 33750.00, 'DECLINING_BALANCE', 5, 1, 1, 'Corporate Garage', 'ACTIVE', true, '2025-05-21 15:12:00.81308', '2025-05-21 15:12:00.81308');
INSERT INTO public.asset_master VALUES (15, 'EU01-AST002', 'Company Vehicle #1', 'Executive transportation vehicle', 'VEHICLES', '2021-10-01', 45000.00, 33750.00, 'DECLINING_BALANCE', 5, 2, 10, 'Corporate Garage', 'ACTIVE', true, '2025-05-21 15:12:00.81308', '2025-05-21 15:12:00.81308');


--
-- Data for Name: uom; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.uom VALUES (1, 'KG', 'Kilogram', NULL, 'weight', true, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (2, 'G', 'Gram', NULL, 'weight', false, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (3, 'LB', 'Pound', NULL, 'weight', false, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (4, 'M', 'Meter', NULL, 'length', true, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (5, 'CM', 'Centimeter', NULL, 'length', false, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (6, 'INCH', 'Inch', NULL, 'length', false, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (7, 'L', 'Liter', NULL, 'volume', true, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (8, 'ML', 'Milliliter', NULL, 'volume', false, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (9, 'GAL', 'Gallon', NULL, 'volume', false, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (10, 'EA', 'Each', NULL, 'unit', true, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (11, 'PCS', 'Pieces', NULL, 'unit', false, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (12, 'BOX', 'Box', NULL, 'package', true, '2025-05-17 05:55:13.089835', 1, '2025-05-17 05:55:13.089835', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (13, 'Oz', 'OZ', 'OZ', 'Weight', false, '2025-05-17 12:34:16.642', 1, '2025-05-17 12:34:16.642', 1, 1, true, NULL);
INSERT INTO public.uom VALUES (14, 'PC', 'Piece', 'Standard Piece', 'Count', true, '2025-05-20 16:12:26.384342', NULL, '2025-05-20 16:12:26.384342', NULL, 1, true, NULL);


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.materials VALUES (1, 'RM-1001', 'Aluminum Sheet', 'High-grade aluminum sheet for industrial use', NULL, 'RAW', 1, 1, 1, 1, '{"width": "1000mm", "height": "2mm", "length": "1000mm"}', 7.5, 5.25, 10, 5, 'external', 20, 100, 30, 7, 0, 'EX', 'reorder_point', 'standard', true, true, true, false, true, '2025-05-20 14:36:38.689364', '2025-05-20 14:36:38.689364', NULL, NULL, 1);
INSERT INTO public.materials VALUES (2, 'RM-1002', 'Steel Rod', 'Carbon steel rod for structural applications', NULL, 'RAW', 1, 1, 2.5, 1, '{"length": "2m", "diameter": "20mm"}', 8.75, 6.5, 10, 5, 'external', 15, 80, 20, 5, 0, 'EX', 'reorder_point', 'standard', true, true, true, false, true, '2025-05-20 14:36:38.705246', '2025-05-20 14:36:38.705246', NULL, NULL, 1);
INSERT INTO public.materials VALUES (3, 'RM-1003', 'Plastic Granulate', 'ABS plastic granulate for injection molding', NULL, 'RAW', 1, 1, 1, 1, '{"bulk": true}', 3.25, 2.1, 25, 25, 'external', 50, 300, 75, 10, 730, 'EX', 'reorder_point', 'lot_for_lot', true, false, true, false, true, '2025-05-20 14:36:38.720782', '2025-05-20 14:36:38.720782', NULL, NULL, 1);
INSERT INTO public.materials VALUES (4, 'RM-1004', 'Copper Wire', 'Industrial grade copper wire', NULL, 'RAW', 4, 1, 0.05, 1, '{"diameter": "2mm"}', 6.5, 4.2, 100, 50, 'external', 200, 1000, 300, 15, 0, 'EX', 'reorder_point', 'standard', true, false, true, false, true, '2025-05-20 14:36:38.735852', '2025-05-20 14:36:38.735852', NULL, NULL, 1);
INSERT INTO public.materials VALUES (5, 'RM-1005', 'Cotton Fabric', 'Premium cotton fabric for textile manufacturing', NULL, 'RAW', 5, 1, 0.2, 1, '{"width": "1.5m"}', 4.25, 3, 50, 10, 'external', 100, 500, 150, 12, 365, 'EX', 'reorder_point', 'standard', true, false, true, false, true, '2025-05-20 14:36:38.750003', '2025-05-20 14:36:38.750003', NULL, NULL, 1);
INSERT INTO public.materials VALUES (6, 'SF-2001', 'Aluminum Frame', 'Partially assembled aluminum frame', NULL, 'SEMI', 10, 1, 3.2, 1, '{"width": "0.8m", "height": "0.1m", "length": "1.2m"}', 35, 22.5, 5, 5, 'in-house', 10, 50, 15, 3, 0, 'EX', 'make_to_stock', 'lot_for_lot', true, false, false, true, true, '2025-05-20 14:36:38.765285', '2025-05-20 14:36:38.765285', NULL, NULL, 1);
INSERT INTO public.materials VALUES (7, 'SF-2002', 'PCB Assembly', 'Partially assembled printed circuit board', NULL, 'SEMI', 10, 1, 0.15, 1, '{"width": "80mm", "height": "2mm", "length": "120mm"}', 28.5, 18, 10, 5, 'in-house', 20, 100, 30, 5, 365, 'EX', 'make_to_stock', 'lot_for_lot', true, false, false, true, true, '2025-05-20 14:36:38.779297', '2025-05-20 14:36:38.779297', NULL, NULL, 1);
INSERT INTO public.materials VALUES (8, 'SF-2003', 'Injection Molded Housing', 'Plastic housing for electronic devices', NULL, 'SEMI', 10, 1, 0.45, 1, '{"width": "150mm", "height": "50mm", "length": "200mm"}', 12.75, 8.5, 25, 25, 'in-house', 50, 250, 75, 2, 0, 'EX', 'make_to_stock', 'lot_for_lot', true, false, false, true, true, '2025-05-20 14:36:38.794055', '2025-05-20 14:36:38.794055', NULL, NULL, 1);
INSERT INTO public.materials VALUES (9, 'FG-3001', 'Smart Thermostat', 'IoT-enabled smart thermostat for home automation', NULL, 'FINI', 10, 1, 0.85, 1, '{"width": "80mm", "height": "35mm", "length": "120mm"}', 85, 45, 1, 1, 'in-house', 10, 50, 15, 7, 730, 'EX', 'make_to_stock', 'lot_for_lot', true, true, false, true, true, '2025-05-20 14:36:38.808153', '2025-05-20 14:36:38.808153', NULL, NULL, 1);
INSERT INTO public.materials VALUES (10, 'FG-3002', 'Industrial Control Panel', 'Advanced control panel for manufacturing equipment', NULL, 'FINI', 10, 1, 12.5, 1, '{"width": "450mm", "height": "200mm", "length": "600mm"}', 1250, 750, 1, 1, 'in-house', 2, 10, 3, 15, 1825, 'EX', 'make_to_order', 'lot_for_lot', true, true, false, true, true, '2025-05-20 14:36:38.822432', '2025-05-20 14:36:38.822432', NULL, NULL, 1);
INSERT INTO public.materials VALUES (11, 'FG-3003', 'LED Light Fixture', 'Energy-efficient LED ceiling light fixture', NULL, 'FINI', 10, 1, 1.8, 1, '{"width": "300mm", "height": "100mm", "length": "300mm"}', 65, 38, 1, 1, 'in-house', 15, 75, 25, 5, 1825, 'EX', 'make_to_stock', 'lot_for_lot', true, true, false, true, true, '2025-05-20 14:36:38.83712', '2025-05-20 14:36:38.83712', NULL, NULL, 1);
INSERT INTO public.materials VALUES (12, 'FG-3004', 'Wireless Router', 'High-speed wireless router for home and office', NULL, 'FINI', 10, 1, 0.9, 1, '{"width": "180mm", "height": "40mm", "length": "230mm"}', 120, 75, 1, 1, 'external', 20, 100, 30, 7, 1095, 'EX', 'make_to_stock', 'standard', true, true, true, false, true, '2025-05-20 14:36:38.851882', '2025-05-20 14:36:38.851882', NULL, NULL, 1);
INSERT INTO public.materials VALUES (13, 'FG-3005', 'Electric Motor', 'Industrial electric motor for manufacturing equipment', NULL, 'FINI', 10, 1, 35, 1, '{"width": "250mm", "height": "250mm", "length": "350mm"}', 890, 650, 1, 1, 'external', 3, 15, 5, 21, 3650, 'EX', 'make_to_order', 'standard', true, true, true, false, true, '2025-05-20 14:36:38.866115', '2025-05-20 14:36:38.866115', NULL, NULL, 1);
INSERT INTO public.materials VALUES (14, 'PM-4001', 'Cardboard Box - Small', 'Corrugated cardboard box for shipping small items', NULL, 'PACK', 10, 1, 0.15, 1, '{"width": "200mm", "height": "200mm", "length": "200mm"}', 1.25, 0.85, 100, 100, 'external', 250, 1000, 350, 3, 365, 'EX', 'reorder_point', 'lot_for_lot', true, false, true, false, true, '2025-05-20 14:36:38.885914', '2025-05-20 14:36:38.885914', NULL, NULL, 1);
INSERT INTO public.materials VALUES (16, 'CHEM-001', 'Industrial Cleaning Solution', 'Multi-purpose industrial cleaning solution', NULL, 'RAW', 1, 1, NULL, NULL, NULL, 25.5, 15.75, NULL, NULL, NULL, 10, 50, NULL, NULL, NULL, NULL, NULL, NULL, true, false, false, false, true, '2025-05-20 16:14:07.491142', '2025-05-20 16:14:07.491142', NULL, NULL, 1);
INSERT INTO public.materials VALUES (17, 'TOOL-001', 'Precision Measurement Tool', 'High-accuracy digital measurement tool', NULL, 'FINI', 1, 1, NULL, NULL, NULL, 199.99, 125, NULL, NULL, NULL, 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, true, false, false, false, true, '2025-05-20 16:14:07.580166', '2025-05-20 16:14:07.580166', NULL, NULL, 1);


--
-- Data for Name: batch_master; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: bill_of_materials; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bill_of_materials VALUES (1, 'BOM-FG-3001', 'BOM for Smart Thermostat', 9, 'Bill of Materials for Smart Thermostat', '1.0', true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bill_of_materials VALUES (2, 'BOM-FG-3002', 'BOM for Industrial Control Panel', 10, 'Bill of Materials for Industrial Control Panel', '1.0', true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bill_of_materials VALUES (3, 'BOM-FG-3003', 'BOM for LED Light Fixture', 11, 'Bill of Materials for LED Light Fixture', '1.0', true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bill_of_materials VALUES (4, 'BOM-PM-4001', 'BOM for Cardboard Box - Small', 14, 'Bill of materials for manufacturing Cardboard Box - Small', '1.0', true, '2025-05-21 15:13:02.975118', '2025-05-21 15:13:02.975118');
INSERT INTO public.bill_of_materials VALUES (5, 'BOM-FG-3004', 'BOM for Wireless Router', 12, 'Bill of materials for manufacturing Wireless Router', '1.0', true, '2025-05-21 15:13:02.975118', '2025-05-21 15:13:02.975118');
INSERT INTO public.bill_of_materials VALUES (6, 'BOM-SF-2003', 'BOM for Injection Molded Housing', 8, 'Bill of materials for manufacturing Injection Molded Housing', '1.0', true, '2025-05-21 15:13:02.975118', '2025-05-21 15:13:02.975118');
INSERT INTO public.bill_of_materials VALUES (7, 'BOM-FG-3005', 'BOM for Electric Motor', 13, 'Bill of materials for manufacturing Electric Motor', '1.0', true, '2025-05-21 15:13:02.975118', '2025-05-21 15:13:02.975118');
INSERT INTO public.bill_of_materials VALUES (8, 'BOM-SF-2001', 'BOM for Aluminum Frame', 6, 'Bill of materials for manufacturing Aluminum Frame', '1.0', true, '2025-05-21 15:13:02.975118', '2025-05-21 15:13:02.975118');


--
-- Data for Name: bom_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bom_items VALUES (1, 1, 1, 5.850, 24.95, true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bom_items VALUES (2, 2, 1, 13.890, 12.59, true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bom_items VALUES (3, 3, 1, 10.720, 12.07, true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bom_items VALUES (4, 1, 2, 11.780, 38.61, true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bom_items VALUES (5, 2, 2, 14.810, 58.75, true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bom_items VALUES (6, 3, 2, 5.700, 36.81, true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bom_items VALUES (7, 1, 3, 11.460, 12.73, true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bom_items VALUES (8, 2, 3, 5.100, 36.66, true, '2025-05-20 22:09:48.919983', '2025-05-20 22:09:48.919983');
INSERT INTO public.bom_items VALUES (9, 1, 4, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (10, 1, 5, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (11, 1, 6, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (12, 1, 7, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (13, 1, 8, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (14, 1, 10, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (15, 1, 11, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (16, 1, 12, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (17, 1, 13, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');
INSERT INTO public.bom_items VALUES (18, 1, 14, 3.500, 12.50, true, '2025-05-21 15:13:22.453554', '2025-05-21 15:13:22.453554');


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories VALUES (1, 'General', 'General category for materials', NULL, '2025-05-20 14:35:23.847433', '2025-05-20 14:35:23.847433');


--
-- Data for Name: chart_of_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.chart_of_accounts VALUES (1, '10000', 'ASSETS', 'Parent account for all assets', 'asset', NULL, 'Assets', 'Assets', NULL, 'debit', true, false, false, false, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (2, '10100', 'Cash and Cash Equivalents', 'Liquid assets', 'asset', 'current_asset', 'Cash', 'Current Assets', NULL, 'debit', true, false, true, false, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (3, '10101', 'Cash on Hand', 'Physical cash', 'asset', 'current_asset', 'Cash', 'Current Assets', NULL, 'debit', true, false, true, false, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (4, '10102', 'Bank Account - Operations', 'Main operating account', 'asset', 'current_asset', 'Cash', 'Current Assets', NULL, 'debit', true, false, true, false, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (5, '10200', 'Accounts Receivable', 'Amounts owed by customers', 'asset', 'current_asset', 'Receivables', 'Current Assets', NULL, 'debit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (6, '10300', 'Inventory', 'Inventory control account', 'asset', 'current_asset', 'Inventory', 'Current Assets', NULL, 'debit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (7, '10301', 'Raw Materials Inventory', 'Raw materials in stock', 'asset', 'current_asset', 'Inventory', 'Current Assets', NULL, 'debit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (8, '10302', 'Work in Process Inventory', 'Partially completed goods', 'asset', 'current_asset', 'Inventory', 'Current Assets', NULL, 'debit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (9, '10303', 'Finished Goods Inventory', 'Completed products ready for sale', 'asset', 'current_asset', 'Inventory', 'Current Assets', NULL, 'debit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (10, '10400', 'Fixed Assets', 'Long-term tangible assets', 'asset', 'non_current_asset', 'Fixed Assets', 'Non-Current Assets', NULL, 'debit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (11, '10401', 'Machinery and Equipment', 'Production equipment', 'asset', 'non_current_asset', 'Fixed Assets', 'Non-Current Assets', NULL, 'debit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (12, '10402', 'Buildings', 'Company-owned buildings', 'asset', 'non_current_asset', 'Fixed Assets', 'Non-Current Assets', NULL, 'debit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (13, '10403', 'Accumulated Depreciation', 'Accumulated depreciation of fixed assets', 'asset', 'non_current_asset', 'Fixed Assets', 'Non-Current Assets', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (14, '20000', 'LIABILITIES', 'Parent account for all liabilities', 'liability', NULL, 'Liabilities', 'Liabilities', NULL, 'credit', true, false, false, false, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (15, '20100', 'Accounts Payable', 'Amounts owed to suppliers', 'liability', 'current_liability', 'Payables', 'Current Liabilities', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (16, '20200', 'Accrued Expenses', 'Expenses incurred but not yet paid', 'liability', 'current_liability', 'Accruals', 'Current Liabilities', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (17, '20300', 'Short-term Loans', 'Loans due within one year', 'liability', 'current_liability', 'Loans', 'Current Liabilities', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (18, '20400', 'Long-term Loans', 'Loans due beyond one year', 'liability', 'non_current_liability', 'Loans', 'Non-Current Liabilities', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (19, '20500', 'Deferred Revenue', 'Payments received for goods/services not yet provided', 'liability', 'current_liability', 'Deferred', 'Current Liabilities', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (20, '30000', 'EQUITY', 'Parent account for all equity', 'equity', NULL, 'Equity', 'Equity', NULL, 'credit', true, false, false, false, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (21, '30100', 'Share Capital', 'Capital from shareholders', 'equity', 'owner_equity', 'Capital', 'Equity', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (22, '30200', 'Retained Earnings', 'Accumulated earnings', 'equity', 'retained_earnings', 'Earnings', 'Equity', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (23, '30300', 'Current Year Earnings', 'Current year profit/loss', 'equity', 'retained_earnings', 'Earnings', 'Equity', NULL, 'credit', true, false, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (24, '40000', 'REVENUE', 'Parent account for all revenue', 'revenue', NULL, 'Revenue', NULL, 'Revenue', 'credit', false, true, false, false, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (25, '40100', 'Sales Revenue - Products', 'Revenue from product sales', 'revenue', 'operating_revenue', 'Sales', NULL, 'Operating Revenue', 'credit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (26, '40200', 'Sales Revenue - Services', 'Revenue from service delivery', 'revenue', 'operating_revenue', 'Sales', NULL, 'Operating Revenue', 'credit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (27, '40300', 'Other Revenue', 'Miscellaneous revenue sources', 'revenue', 'other_revenue', 'Other', NULL, 'Other Revenue', 'credit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (28, '50000', 'EXPENSES', 'Parent account for all expenses', 'expense', NULL, 'Expenses', NULL, 'Expenses', 'debit', false, true, false, false, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (29, '50100', 'Cost of Goods Sold', 'Direct costs of products sold', 'expense', 'operating_expense', 'COGS', NULL, 'Cost of Sales', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (30, '50101', 'Raw Materials Consumed', 'Cost of raw materials used in production', 'expense', 'operating_expense', 'COGS', NULL, 'Cost of Sales', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (31, '50102', 'Direct Labor', 'Cost of direct production labor', 'expense', 'operating_expense', 'COGS', NULL, 'Cost of Sales', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (32, '50103', 'Manufacturing Overhead', 'Indirect production costs', 'expense', 'operating_expense', 'COGS', NULL, 'Cost of Sales', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (33, '50200', 'Selling Expenses', 'Costs related to sales activities', 'expense', 'operating_expense', 'Selling', NULL, 'Operating Expenses', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (34, '50300', 'Administrative Expenses', 'General business operation costs', 'expense', 'operating_expense', 'Admin', NULL, 'Operating Expenses', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (35, '50400', 'Research and Development', 'R&D expenses', 'expense', 'operating_expense', 'R&D', NULL, 'Operating Expenses', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (36, '50500', 'Finance Costs', 'Interest and other financial expenses', 'expense', 'other_expense', 'Finance', NULL, 'Other Expenses', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (37, '50600', 'Depreciation Expense', 'Depreciation of fixed assets', 'expense', 'operating_expense', 'Depreciation', NULL, 'Operating Expenses', 'debit', false, true, false, true, false, false, true, 2, NULL, '2025-05-17 15:12:41.573183', '2025-05-17 15:12:41.573183', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (39, 'US-GAAP', 'US Generally Accepted Accounting Principles', 'Standard US GAAP Chart of Accounts for manufacturing companies', 'CHART', NULL, 'STANDARD', NULL, NULL, NULL, false, false, false, false, false, false, true, 1, NULL, '2025-06-04 02:37:30.635647', '2025-06-04 02:37:30.635647', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (40, 'IFRS-STD', 'International Financial Reporting Standards', 'IFRS compliant chart of accounts for international operations', 'CHART', NULL, 'INTERNATIONAL', NULL, NULL, NULL, false, false, false, false, false, false, true, 1, NULL, '2025-06-04 02:37:30.635647', '2025-06-04 02:37:30.635647', NULL, NULL, 1, NULL);
INSERT INTO public.chart_of_accounts VALUES (41, 'MFG-COA', 'Manufacturing Company Chart of Accounts', 'Specialized chart of accounts for manufacturing operations', 'CHART', NULL, 'MANUFACTURING', NULL, NULL, NULL, false, false, false, false, false, false, true, 1, NULL, '2025-06-04 02:37:30.635647', '2025-06-04 02:37:30.635647', NULL, NULL, 1, NULL);


--
-- Data for Name: fiscal_year_variants; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fiscal_year_variants VALUES (1, 'K4', 'Calendar Year (Jan-Dec)', 'Standard calendar year with 12 monthly periods', 1, 12, false, true, true, '2025-06-04 02:37:36.574909', '2025-06-04 02:37:36.574909');
INSERT INTO public.fiscal_year_variants VALUES (2, 'K7', 'Fiscal Year (Apr-Mar)', 'Fiscal year starting April with 12 monthly periods', 4, 12, false, false, true, '2025-06-04 02:37:36.574909', '2025-06-04 02:37:36.574909');
INSERT INTO public.fiscal_year_variants VALUES (3, 'K2', 'Fiscal Year (Jul-Jun)', 'Fiscal year starting July with 12 monthly periods', 7, 12, false, false, true, '2025-06-04 02:37:36.574909', '2025-06-04 02:37:36.574909');
INSERT INTO public.fiscal_year_variants VALUES (4, 'V3', 'Weekly Periods (52 weeks)', 'Annual cycle with 52 weekly periods', 1, 52, false, true, true, '2025-06-04 02:37:36.574909', '2025-06-04 02:37:36.574909');


--
-- Data for Name: company_code_chart_assignments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.company_code_chart_assignments VALUES (1, 1, 39, 1, '2025-06-04 02:39:58.298261', true, '2025-06-04 02:39:58.298261');


--
-- Data for Name: profit_centers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profit_centers VALUES (1, 'PC001', 'Manufacturing Division', 'PRODUCTION', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (2, 'PC001-01', 'Product Line A', 'PRODUCTION', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (3, 'PC001-02', 'Product Line B', 'PRODUCTION', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (4, 'PC001-03', 'Custom Products', 'PRODUCTION', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (5, 'PC002', 'Sales Division', 'SALES', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (6, 'PC002-01', 'Domestic Sales', 'SALES', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (7, 'PC002-02', 'Export Sales', 'SALES', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (8, 'PC002-03', 'Online Sales', 'SALES', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (9, 'PC003', 'Service Division', 'SERVICE', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (10, 'PC003-01', 'Maintenance Services', 'SERVICE', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (11, 'PC003-02', 'Consulting Services', 'SERVICE', 'US01', 'US01', NULL, NULL, NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (12, 'PC-PROD-A', 'Product Line A - Main product profitability', 'PRODUCT_LINE', 'US01', 'US01', NULL, NULL, 'John Smith', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (13, 'PC-PROD-B', 'Product Line B - Secondary product line', 'PRODUCT_LINE', 'US01', 'US01', NULL, NULL, 'Jane Doe', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (14, 'PC-SERV', 'Service Division - Service and maintenance revenue', 'DIVISION', 'US01', 'US01', NULL, NULL, 'Mike Johnson', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (15, 'PC-REG-E', 'Eastern Region - East coast sales region', 'REGION', 'US01', 'US01', NULL, NULL, 'Sarah Davis', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (16, 'PC-REG-W', 'Western Region - West coast sales region', 'REGION', 'US01', 'US01', NULL, NULL, 'Tom Brown', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (17, 'PC-REG-C', 'Central Region - Central US sales region', 'REGION', 'US01', 'US01', NULL, NULL, 'Lisa Garcia', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (18, 'PC-EXPORT', 'Export Division - International sales and exports', 'DIVISION', 'US01', 'US01', NULL, NULL, 'David Miller', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (19, 'PC-RETAIL', 'Retail Channel - Direct retail sales', 'CHANNEL', 'US01', 'US01', NULL, NULL, 'Chris Lee', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);
INSERT INTO public.profit_centers VALUES (20, 'PC-WHSALE', 'Wholesale Channel - Wholesale and distribution', 'CHANNEL', 'US01', 'US01', NULL, NULL, 'Emily Chen', '2025-01-01', NULL, '2025-06-04 02:39:51.210528', 1, NULL, NULL);


--
-- Data for Name: copa_actuals; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cost_allocations; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: cost_centers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cost_centers VALUES (1, 'CC001', 'Manufacturing Line 1', 'PRODUCTION', 'US01', 'US01', 'PRODUCTION', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (2, 'CC002', 'Manufacturing Line 2', 'PRODUCTION', 'US01', 'US01', 'PRODUCTION', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (3, 'CC003', 'Quality Control', 'PRODUCTION', 'US01', 'US01', 'PRODUCTION', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (4, 'CC101', 'Human Resources', 'ADMINISTRATIVE', 'US01', 'US01', 'ADMIN', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (5, 'CC102', 'IT Department', 'SERVICE', 'US01', 'US01', 'ADMIN', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (6, 'CC103', 'Finance Department', 'ADMINISTRATIVE', 'US01', 'US01', 'ADMIN', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (7, 'CC201', 'Sales North', 'SALES', 'US01', 'US01', 'SALES', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (8, 'CC202', 'Sales South', 'SALES', 'US01', 'US01', 'SALES', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (9, 'CC203', 'Sales International', 'SALES', 'US01', 'US01', 'SALES', NULL, '2025-06-03', NULL, '2025-06-03 17:58:50.654812', '2025-06-03 17:58:50.654812', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (11, 'PROD001', 'Production Line 1 - Manufacturing line for main products', 'PRODUCTION', 'US01', 'US01', NULL, 'John Smith', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (12, 'PROD002', 'Production Line 2 - Secondary manufacturing line', 'PRODUCTION', 'US01', 'US01', NULL, 'Jane Doe', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (13, 'QC001', 'Quality Control - Quality assurance and testing', 'QUALITY', 'US01', 'US01', NULL, 'Mike Johnson', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (14, 'MAINT001', 'Maintenance - Equipment maintenance and repairs', 'MAINTENANCE', 'US01', 'US01', NULL, 'Bob Wilson', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (15, 'ADMIN001', 'Administration - General administrative functions', 'ADMIN', 'US01', 'US01', NULL, 'Sarah Davis', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (16, 'SALES001', 'Sales Department - Sales and customer relations', 'SALES', 'US01', 'US01', NULL, 'Tom Brown', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (17, 'MKTG001', 'Marketing - Marketing and advertising', 'MARKETING', 'US01', 'US01', NULL, 'Lisa Garcia', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (18, 'HR001', 'Human Resources - HR administration and payroll', 'HR', 'US01', 'US01', NULL, 'David Miller', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (19, 'IT001', 'Information Technology - IT support and infrastructure', 'IT', 'US01', 'US01', NULL, 'Chris Lee', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (20, 'WHSE001', 'Warehouse Operations - Inventory and logistics', 'WAREHOUSE', 'US01', 'US01', NULL, 'Emily Chen', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (21, 'PURCH001', 'Purchasing Department - Procurement and vendor management', 'PURCHASING', 'US01', 'US01', NULL, 'Mark Wilson', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);
INSERT INTO public.cost_centers VALUES (22, 'FIN001', 'Finance Department - Financial planning and accounting', 'FINANCE', 'US01', 'US01', NULL, 'Jennifer Brown', '2025-01-01', NULL, '2025-06-04 02:39:01.679531', '2025-06-04 02:39:01.679531', 1, NULL, NULL);


--
-- Data for Name: cost_center_actuals; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cost_center_actuals VALUES (73, 'CC001', 2025, 6, '400000', NULL, 15458.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.655769', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (74, 'CC001', 2025, 6, '410000', NULL, 6496.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.655769', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (75, 'CC001', 2025, 6, '420000', NULL, 4239.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.655769', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (76, 'CC002', 2025, 6, '400000', NULL, 12745.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.681496', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (77, 'CC002', 2025, 6, '410000', NULL, 5217.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.681496', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (78, 'CC002', 2025, 6, '420000', NULL, 4493.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.681496', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (79, 'CC003', 2025, 6, '400000', NULL, 12433.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.700578', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (80, 'CC003', 2025, 6, '410000', NULL, 5814.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.700578', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (81, 'CC003', 2025, 6, '420000', NULL, 4665.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.700578', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (82, 'CC101', 2025, 6, '400000', NULL, 12661.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.719733', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (83, 'CC101', 2025, 6, '410000', NULL, 5950.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.719733', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (84, 'CC101', 2025, 6, '420000', NULL, 3854.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.719733', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (85, 'CC102', 2025, 6, '400000', NULL, 11254.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.738956', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (86, 'CC102', 2025, 6, '410000', NULL, 5562.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.738956', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (87, 'CC102', 2025, 6, '420000', NULL, 4225.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.738956', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (88, 'CC103', 2025, 6, '400000', NULL, 12331.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.757979', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (89, 'CC103', 2025, 6, '410000', NULL, 5990.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.757979', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (90, 'CC103', 2025, 6, '420000', NULL, 3248.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.757979', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (91, 'CC201', 2025, 6, '400000', NULL, 13570.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.776904', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (92, 'CC201', 2025, 6, '410000', NULL, 5203.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.776904', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (93, 'CC201', 2025, 6, '420000', NULL, 3285.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.776904', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (94, 'CC202', 2025, 6, '400000', NULL, 13551.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.796299', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (95, 'CC202', 2025, 6, '410000', NULL, 6018.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.796299', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (96, 'CC202', 2025, 6, '420000', NULL, 4622.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.796299', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (97, 'CC203', 2025, 6, '400000', NULL, 13779.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.815951', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (98, 'CC203', 2025, 6, '410000', NULL, 5969.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.815951', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (99, 'CC203', 2025, 6, '420000', NULL, 4124.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.815951', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (100, 'PROD001', 2025, 6, '400000', NULL, 14128.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.834899', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (101, 'PROD001', 2025, 6, '410000', NULL, 6719.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.834899', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (102, 'PROD001', 2025, 6, '420000', NULL, 4275.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.834899', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (103, 'PROD002', 2025, 6, '400000', NULL, 11436.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.854024', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (104, 'PROD002', 2025, 6, '410000', NULL, 4838.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.854024', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (105, 'PROD002', 2025, 6, '420000', NULL, 3207.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.854024', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (106, 'QC001', 2025, 6, '400000', NULL, 17617.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.87299', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (107, 'QC001', 2025, 6, '410000', NULL, 5227.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.87299', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (108, 'QC001', 2025, 6, '420000', NULL, 4378.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.87299', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (109, 'MAINT001', 2025, 6, '400000', NULL, 14777.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.892291', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (110, 'MAINT001', 2025, 6, '410000', NULL, 4942.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.892291', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (111, 'MAINT001', 2025, 6, '420000', NULL, 4167.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.892291', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (112, 'ADMIN001', 2025, 6, '400000', NULL, 16667.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.911419', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (113, 'ADMIN001', 2025, 6, '410000', NULL, 5882.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.911419', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (114, 'ADMIN001', 2025, 6, '420000', NULL, 3381.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.911419', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (115, 'SALES001', 2025, 6, '400000', NULL, 11242.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.930376', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (116, 'SALES001', 2025, 6, '410000', NULL, 4897.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.930376', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (117, 'SALES001', 2025, 6, '420000', NULL, 4373.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.930376', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (118, 'MKTG001', 2025, 6, '400000', NULL, 14653.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.949313', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (119, 'MKTG001', 2025, 6, '410000', NULL, 5983.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.949313', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (120, 'MKTG001', 2025, 6, '420000', NULL, 4271.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.949313', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (121, 'HR001', 2025, 6, '400000', NULL, 16021.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.968249', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (122, 'HR001', 2025, 6, '410000', NULL, 6506.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.968249', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (123, 'HR001', 2025, 6, '420000', NULL, 4061.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.968249', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (124, 'IT001', 2025, 6, '400000', NULL, 12825.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.98889', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (125, 'IT001', 2025, 6, '410000', NULL, 4983.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.98889', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (126, 'IT001', 2025, 6, '420000', NULL, 3086.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:46.98889', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (127, 'WHSE001', 2025, 6, '400000', NULL, 12759.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.007928', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (128, 'WHSE001', 2025, 6, '410000', NULL, 5878.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.007928', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (129, 'WHSE001', 2025, 6, '420000', NULL, 3668.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.007928', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (130, 'PURCH001', 2025, 6, '400000', NULL, 12884.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.027', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (131, 'PURCH001', 2025, 6, '410000', NULL, 6815.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.027', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (132, 'PURCH001', 2025, 6, '420000', NULL, 3939.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.027', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (133, 'FIN001', 2025, 6, '400000', NULL, 16354.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.046322', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (134, 'FIN001', 2025, 6, '410000', NULL, 6939.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.046322', NULL, NULL, NULL);
INSERT INTO public.cost_center_actuals VALUES (135, 'FIN001', 2025, 6, '420000', NULL, 4041.00, 0.000, 'USD', NULL, '2025-06-01', NULL, NULL, '2025-06-04 03:47:47.046322', NULL, NULL, NULL);


--
-- Data for Name: cost_center_planning; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cost_center_planning VALUES (76, 'CC001', 2025, 6, '000', '400000', NULL, 17842.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.209456');
INSERT INTO public.cost_center_planning VALUES (77, 'CC001', 2025, 6, '000', '410000', NULL, 5563.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.209456');
INSERT INTO public.cost_center_planning VALUES (78, 'CC001', 2025, 6, '000', '420000', NULL, 4055.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.209456');
INSERT INTO public.cost_center_planning VALUES (79, 'CC002', 2025, 6, '000', '400000', NULL, 18925.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.230534');
INSERT INTO public.cost_center_planning VALUES (80, 'CC002', 2025, 6, '000', '410000', NULL, 5017.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.230534');
INSERT INTO public.cost_center_planning VALUES (81, 'CC002', 2025, 6, '000', '420000', NULL, 3302.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.230534');
INSERT INTO public.cost_center_planning VALUES (82, 'CC003', 2025, 6, '000', '400000', NULL, 18392.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.249348');
INSERT INTO public.cost_center_planning VALUES (83, 'CC003', 2025, 6, '000', '410000', NULL, 6902.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.249348');
INSERT INTO public.cost_center_planning VALUES (84, 'CC003', 2025, 6, '000', '420000', NULL, 3241.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.249348');
INSERT INTO public.cost_center_planning VALUES (85, 'CC101', 2025, 6, '000', '400000', NULL, 14712.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.268569');
INSERT INTO public.cost_center_planning VALUES (86, 'CC101', 2025, 6, '000', '410000', NULL, 5501.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.268569');
INSERT INTO public.cost_center_planning VALUES (87, 'CC101', 2025, 6, '000', '420000', NULL, 3737.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.268569');
INSERT INTO public.cost_center_planning VALUES (88, 'CC102', 2025, 6, '000', '400000', NULL, 13910.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.288525');
INSERT INTO public.cost_center_planning VALUES (89, 'CC102', 2025, 6, '000', '410000', NULL, 5501.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.288525');
INSERT INTO public.cost_center_planning VALUES (90, 'CC102', 2025, 6, '000', '420000', NULL, 3805.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.288525');
INSERT INTO public.cost_center_planning VALUES (91, 'CC103', 2025, 6, '000', '400000', NULL, 12115.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.307972');
INSERT INTO public.cost_center_planning VALUES (92, 'CC103', 2025, 6, '000', '410000', NULL, 5136.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.307972');
INSERT INTO public.cost_center_planning VALUES (93, 'CC103', 2025, 6, '000', '420000', NULL, 4658.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.307972');
INSERT INTO public.cost_center_planning VALUES (94, 'CC201', 2025, 6, '000', '400000', NULL, 15398.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.328525');
INSERT INTO public.cost_center_planning VALUES (95, 'CC201', 2025, 6, '000', '410000', NULL, 7382.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.328525');
INSERT INTO public.cost_center_planning VALUES (96, 'CC201', 2025, 6, '000', '420000', NULL, 4363.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.328525');
INSERT INTO public.cost_center_planning VALUES (97, 'CC202', 2025, 6, '000', '400000', NULL, 14957.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.351233');
INSERT INTO public.cost_center_planning VALUES (98, 'CC202', 2025, 6, '000', '410000', NULL, 5501.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.351233');
INSERT INTO public.cost_center_planning VALUES (99, 'CC202', 2025, 6, '000', '420000', NULL, 3547.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.351233');
INSERT INTO public.cost_center_planning VALUES (100, 'CC203', 2025, 6, '000', '400000', NULL, 18233.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.370862');
INSERT INTO public.cost_center_planning VALUES (101, 'CC203', 2025, 6, '000', '410000', NULL, 7605.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.370862');
INSERT INTO public.cost_center_planning VALUES (102, 'CC203', 2025, 6, '000', '420000', NULL, 4669.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.370862');
INSERT INTO public.cost_center_planning VALUES (103, 'PROD001', 2025, 6, '000', '400000', NULL, 13597.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.389604');
INSERT INTO public.cost_center_planning VALUES (104, 'PROD001', 2025, 6, '000', '410000', NULL, 5406.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.389604');
INSERT INTO public.cost_center_planning VALUES (105, 'PROD001', 2025, 6, '000', '420000', NULL, 4078.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.389604');
INSERT INTO public.cost_center_planning VALUES (106, 'PROD002', 2025, 6, '000', '400000', NULL, 15111.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.40845');
INSERT INTO public.cost_center_planning VALUES (107, 'PROD002', 2025, 6, '000', '410000', NULL, 6545.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.40845');
INSERT INTO public.cost_center_planning VALUES (108, 'PROD002', 2025, 6, '000', '420000', NULL, 4268.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.40845');
INSERT INTO public.cost_center_planning VALUES (109, 'QC001', 2025, 6, '000', '400000', NULL, 18547.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.427524');
INSERT INTO public.cost_center_planning VALUES (110, 'QC001', 2025, 6, '000', '410000', NULL, 7379.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.427524');
INSERT INTO public.cost_center_planning VALUES (111, 'QC001', 2025, 6, '000', '420000', NULL, 4779.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.427524');
INSERT INTO public.cost_center_planning VALUES (112, 'MAINT001', 2025, 6, '000', '400000', NULL, 14610.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.44636');
INSERT INTO public.cost_center_planning VALUES (113, 'MAINT001', 2025, 6, '000', '410000', NULL, 5918.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.44636');
INSERT INTO public.cost_center_planning VALUES (114, 'MAINT001', 2025, 6, '000', '420000', NULL, 4384.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.44636');
INSERT INTO public.cost_center_planning VALUES (115, 'ADMIN001', 2025, 6, '000', '400000', NULL, 14995.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.4653');
INSERT INTO public.cost_center_planning VALUES (116, 'ADMIN001', 2025, 6, '000', '410000', NULL, 5449.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.4653');
INSERT INTO public.cost_center_planning VALUES (117, 'ADMIN001', 2025, 6, '000', '420000', NULL, 3547.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.4653');
INSERT INTO public.cost_center_planning VALUES (118, 'SALES001', 2025, 6, '000', '400000', NULL, 15655.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.484297');
INSERT INTO public.cost_center_planning VALUES (119, 'SALES001', 2025, 6, '000', '410000', NULL, 5067.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.484297');
INSERT INTO public.cost_center_planning VALUES (120, 'SALES001', 2025, 6, '000', '420000', NULL, 3466.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.484297');
INSERT INTO public.cost_center_planning VALUES (121, 'MKTG001', 2025, 6, '000', '400000', NULL, 16753.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.503356');
INSERT INTO public.cost_center_planning VALUES (122, 'MKTG001', 2025, 6, '000', '410000', NULL, 5081.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.503356');
INSERT INTO public.cost_center_planning VALUES (123, 'MKTG001', 2025, 6, '000', '420000', NULL, 4975.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.503356');
INSERT INTO public.cost_center_planning VALUES (124, 'HR001', 2025, 6, '000', '400000', NULL, 17167.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.522386');
INSERT INTO public.cost_center_planning VALUES (125, 'HR001', 2025, 6, '000', '410000', NULL, 6228.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.522386');
INSERT INTO public.cost_center_planning VALUES (126, 'HR001', 2025, 6, '000', '420000', NULL, 3479.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.522386');
INSERT INTO public.cost_center_planning VALUES (127, 'IT001', 2025, 6, '000', '400000', NULL, 12315.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.542082');
INSERT INTO public.cost_center_planning VALUES (128, 'IT001', 2025, 6, '000', '410000', NULL, 6723.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.542082');
INSERT INTO public.cost_center_planning VALUES (129, 'IT001', 2025, 6, '000', '420000', NULL, 3600.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.542082');
INSERT INTO public.cost_center_planning VALUES (130, 'WHSE001', 2025, 6, '000', '400000', NULL, 17339.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.561664');
INSERT INTO public.cost_center_planning VALUES (131, 'WHSE001', 2025, 6, '000', '410000', NULL, 6535.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.561664');
INSERT INTO public.cost_center_planning VALUES (132, 'WHSE001', 2025, 6, '000', '420000', NULL, 4338.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.561664');
INSERT INTO public.cost_center_planning VALUES (133, 'PURCH001', 2025, 6, '000', '400000', NULL, 17253.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.580983');
INSERT INTO public.cost_center_planning VALUES (134, 'PURCH001', 2025, 6, '000', '410000', NULL, 6565.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.580983');
INSERT INTO public.cost_center_planning VALUES (135, 'PURCH001', 2025, 6, '000', '420000', NULL, 3441.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.580983');
INSERT INTO public.cost_center_planning VALUES (136, 'FIN001', 2025, 6, '000', '400000', NULL, 16024.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.60021');
INSERT INTO public.cost_center_planning VALUES (137, 'FIN001', 2025, 6, '000', '410000', NULL, 5831.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.60021');
INSERT INTO public.cost_center_planning VALUES (138, 'FIN001', 2025, 6, '000', '420000', NULL, 3808.00, 0.000, 'USD', NULL, NULL, '2025-06-04 03:47:46.60021');


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.regions VALUES (1, 'NA', 'North America', 'United States, Canada, and Mexico', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.regions VALUES (2, 'SA', 'South America', 'South American countries', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.regions VALUES (3, 'EMEA', 'Europe, Middle East, and Africa', 'Europe, Middle East, and Africa regions', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.regions VALUES (4, 'APAC', 'Asia Pacific', 'Asia, Australia, and Pacific Islands', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.countries VALUES (1, 'MX', 'Mexico', 1, 'MXN', 'es-MX', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (2, 'CA', 'Canada', 1, 'CAD', 'en-CA', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (3, 'US', 'United States', 1, 'USD', 'en-US', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (4, 'AR', 'Argentina', 2, 'ARS', 'es-AR', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (5, 'BR', 'Brazil', 2, 'BRL', 'pt-BR', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (6, 'FR', 'France', 3, 'EUR', 'fr-FR', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (7, 'DE', 'Germany', 3, 'EUR', 'de-DE', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (8, 'GB', 'United Kingdom', 3, 'GBP', 'en-GB', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (9, 'AU', 'Australia', 4, 'AUD', 'en-AU', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (10, 'IN', 'India', 4, 'INR', 'en-IN', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (11, 'CN', 'China', 4, 'CNY', 'zh-CN', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');
INSERT INTO public.countries VALUES (12, 'JP', 'Japan', 4, 'JPY', 'ja-JP', true, '2025-05-20 22:09:35.140169', '2025-05-20 22:09:35.140169');


--
-- Data for Name: credit_control_areas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.credit_control_areas VALUES (1, 'CC001', 'North America Credit', 'Credit control for North American customers', 2, 'medium_risk', 30, 15, NULL, 'monthly', 'USD', 'Michael Brown', 'active', true, NULL, '2025-05-17 14:59:22.779157', '2025-05-17 14:59:22.779157', NULL, NULL);
INSERT INTO public.credit_control_areas VALUES (2, 'CC002', 'EMEA Credit', 'Credit control for European, Middle Eastern, and African customers', 2, 'high_risk', 45, 10, NULL, 'monthly', 'EUR', 'Emma Schmidt', 'active', true, NULL, '2025-05-17 14:59:22.779157', '2025-05-17 14:59:22.779157', NULL, NULL);
INSERT INTO public.credit_control_areas VALUES (3, 'CC003', 'APAC Credit', 'Credit control for Asia-Pacific customers', 2, 'low_risk', 60, 5, NULL, 'monthly', 'USD', 'James Wong', 'active', true, NULL, '2025-05-17 14:59:22.779157', '2025-05-17 14:59:22.779157', NULL, NULL);
INSERT INTO public.credit_control_areas VALUES (4, 'CC004', 'Strategic Customers', 'Strategic Customers - Credit control for VIP customers', 1, 'VIP', 60, 15, NULL, 'monthly', 'USD', NULL, 'active', true, NULL, '2025-05-20 04:52:27.962894', '2025-05-20 04:52:27.962894', NULL, NULL);
INSERT INTO public.credit_control_areas VALUES (5, 'CC005', 'UK Credit Management', 'UK Credit Management - Credit control for standard customers', 11, 'standard', 30, 5, NULL, 'monthly', 'GBP', NULL, 'active', true, NULL, '2025-05-20 04:52:28.006898', '2025-05-20 04:52:28.006898', NULL, NULL);


--
-- Data for Name: custom_reports; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.custom_reports VALUES (1, 'Sales by Month', 'Monthly sales revenue analysis', 'SELECT DATE_TRUNC(''month'', order_date) as month, SUM(total_amount) as revenue FROM sales_orders WHERE order_date >= NOW() - INTERVAL ''12 months'' GROUP BY month ORDER BY month', '{"type": "line", "title": "Sales Revenue by Month", "xLabel": "Month", "yLabel": "Revenue"}', '[]', 'sales', false, 'system', '2025-06-04 15:23:51.126114', '2025-06-04 15:23:51.126114');
INSERT INTO public.custom_reports VALUES (2, 'Top Customers by Revenue', 'Customers with highest revenue contribution', 'SELECT c.name as customer_name, SUM(so.total_amount) as total_revenue FROM customers c JOIN sales_orders so ON c.id = so.customer_id GROUP BY c.id, c.name ORDER BY total_revenue DESC LIMIT 10', '{"type": "bar", "title": "Top 10 Customers by Revenue", "xLabel": "Customer", "yLabel": "Revenue"}', '[]', 'sales', false, 'system', '2025-06-04 15:23:51.126114', '2025-06-04 15:23:51.126114');
INSERT INTO public.custom_reports VALUES (3, 'Inventory Levels by Category', 'Current inventory levels grouped by material category', 'SELECT cat.name as category, SUM(inv.quantity) as total_quantity FROM inventory inv JOIN materials m ON inv.material_id = m.id JOIN categories cat ON m.category_id = cat.id GROUP BY cat.id, cat.name ORDER BY total_quantity DESC', '{"type": "pie", "title": "Inventory Distribution by Category"}', '[]', 'inventory', false, 'system', '2025-06-04 15:23:51.126114', '2025-06-04 15:23:51.126114');
INSERT INTO public.custom_reports VALUES (4, 'Cost Center Expenses', 'Expenses by cost center for current year', 'SELECT cc.name as cost_center, SUM(e.amount) as total_expenses FROM cost_centers cc LEFT JOIN expenses e ON cc.id = e.cost_center_id WHERE EXTRACT(YEAR FROM e.expense_date) = EXTRACT(YEAR FROM NOW()) GROUP BY cc.id, cc.name ORDER BY total_expenses DESC', '{"type": "column", "title": "Expenses by Cost Center", "xLabel": "Cost Center", "yLabel": "Amount"}', '[]', 'finance', false, 'system', '2025-06-04 15:23:51.126114', '2025-06-04 15:23:51.126114');
INSERT INTO public.custom_reports VALUES (5, 'Purchase Orders by Vendor', 'Purchase order volumes by vendor', 'SELECT v.name as vendor_name, COUNT(po.id) as order_count, SUM(po.total_amount) as total_amount FROM vendors v JOIN purchase_orders po ON v.id = po.vendor_id GROUP BY v.id, v.name ORDER BY total_amount DESC LIMIT 15', '{"type": "stacked_bar", "title": "Purchase Orders by Vendor", "xLabel": "Vendor", "yLabel": "Count/Amount"}', '[]', 'purchase', false, 'system', '2025-06-04 15:23:51.126114', '2025-06-04 15:23:51.126114');


--
-- Data for Name: customer_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customer_contacts VALUES (1, 1, 'Jessica', 'Brown', 'Operations Manager', 'Operations', 'jessica.brown@example.com', '(555) 456-7890', '(555) 654-3210', true, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:12.979', '2025-05-22 13:33:12.979', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (2, 1, 'John', 'Smith', 'Purchasing Manager', 'Procurement', 'john.smith@example.com', '(555) 123-4567', '(555) 987-6543', false, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.026', '2025-05-22 13:33:13.026', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (3, 1, 'Michael', 'Williams', 'CEO', 'Executive', 'michael.williams@example.com', '(555) 345-6789', '(555) 765-4321', false, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.069', '2025-05-22 13:33:13.069', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (4, 2, 'Jessica', 'Brown', 'Operations Manager', 'Operations', 'jessica.brown@example.com', '(555) 456-7890', '(555) 654-3210', true, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.123', '2025-05-22 13:33:13.123', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (5, 3, 'Michael', 'Williams', 'CEO', 'Executive', 'michael.williams@example.com', '(555) 345-6789', '(555) 765-4321', true, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.176', '2025-05-22 13:33:13.176', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (6, 3, 'Jessica', 'Brown', 'Operations Manager', 'Operations', 'jessica.brown@example.com', '(555) 456-7890', '(555) 654-3210', false, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.229', '2025-05-22 13:33:13.229', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (7, 3, 'John', 'Smith', 'Purchasing Manager', 'Procurement', 'john.smith@example.com', '(555) 123-4567', '(555) 987-6543', false, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.269', '2025-05-22 13:33:13.269', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (8, 4, 'Sarah', 'Johnson', 'Finance Director', 'Finance', 'sarah.johnson@example.com', '(555) 234-5678', '(555) 876-5432', true, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.306', '2025-05-22 13:33:13.306', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (9, 4, 'Sarah', 'Johnson', 'Finance Director', 'Finance', 'sarah.johnson@example.com', '(555) 234-5678', '(555) 876-5432', false, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.354', '2025-05-22 13:33:13.354', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (10, 5, 'Michael', 'Williams', 'CEO', 'Executive', 'michael.williams@example.com', '(555) 345-6789', '(555) 765-4321', true, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.393', '2025-05-22 13:33:13.393', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (11, 5, 'Michael', 'Williams', 'CEO', 'Executive', 'michael.williams@example.com', '(555) 345-6789', '(555) 765-4321', false, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.437', '2025-05-22 13:33:13.437', NULL, NULL);
INSERT INTO public.customer_contacts VALUES (12, 5, 'Michael', 'Williams', 'CEO', 'Executive', 'michael.williams@example.com', '(555) 345-6789', '(555) 765-4321', false, false, false, false, false, 'English', NULL, true, '2025-05-22 13:33:13.473', '2025-05-22 13:33:13.473', NULL, NULL);


--
-- Data for Name: dashboard_configs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dashboard_configs VALUES (1, 1, '{"widgets": [{"id": "custom-widget-1748008057711", "type": "kpi", "title": "quotes Key Metrics", "width": 1, "position": 1}]}', '2025-05-23 13:47:27.063425+00');
INSERT INTO public.dashboard_configs VALUES (2, 1, '{"widgets": []}', '2025-05-23 13:47:51.571587+00');
INSERT INTO public.dashboard_configs VALUES (3, 1, '{"widgets": [{"id": "custom-widget-1748008102822", "type": "table", "title": "stock Summary", "width": 1, "position": 1}]}', '2025-05-23 13:48:12.006036+00');
INSERT INTO public.dashboard_configs VALUES (4, 1, '{"widgets": []}', '2025-05-23 13:52:34.618065+00');
INSERT INTO public.dashboard_configs VALUES (5, 1, '{"widgets": [{"id": "custom-widget-1748008386790", "type": "table", "title": "Expenses Summary", "width": 1, "position": 1}]}', '2025-05-23 13:52:55.991037+00');
INSERT INTO public.dashboard_configs VALUES (6, 1, '{"widgets": [{"id": "custom-widget-1748008386790", "type": "table", "title": "Expenses Summary", "width": 1, "position": 1}, {"id": "custom-widget-1748008427350", "type": "line-chart", "title": "capacity Trend", "width": 2, "position": 2}]}', '2025-05-23 13:53:36.644814+00');
INSERT INTO public.dashboard_configs VALUES (7, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 2}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 3}]}', '2025-05-23 14:54:12.045456+00');
INSERT INTO public.dashboard_configs VALUES (8, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 2}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 3}]}', '2025-05-23 14:54:27.164226+00');
INSERT INTO public.dashboard_configs VALUES (9, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:22:53.397393+00');
INSERT INTO public.dashboard_configs VALUES (10, 1, '{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:22:58.232958+00');
INSERT INTO public.dashboard_configs VALUES (11, 1, '{"widgets": [{"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:23:52.777618+00');
INSERT INTO public.dashboard_configs VALUES (12, 1, '{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:24:12.051902+00');
INSERT INTO public.dashboard_configs VALUES (13, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:28:50.914169+00');
INSERT INTO public.dashboard_configs VALUES (14, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:34:35.768835+00');
INSERT INTO public.dashboard_configs VALUES (15, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:35:09.742322+00');
INSERT INTO public.dashboard_configs VALUES (16, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:37:10.877803+00');
INSERT INTO public.dashboard_configs VALUES (17, 1, '{"widgets": [{"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:37:11.153819+00');
INSERT INTO public.dashboard_configs VALUES (18, 1, '{"widgets": [{"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 15:37:12.008393+00');
INSERT INTO public.dashboard_configs VALUES (19, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 1}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 17:57:03.304339+00');
INSERT INTO public.dashboard_configs VALUES (20, 1, '{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-23 17:57:12.171106+00');
INSERT INTO public.dashboard_configs VALUES (21, 1, '{"widgets": [{"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 0}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 1}, {"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-24 01:45:18.72063+00');
INSERT INTO public.dashboard_configs VALUES (22, 1, '{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 1}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}, {"id": "custom-widget-1748051153852", "type": "table", "title": "capacity Summary", "width": 1, "position": 5}]}', '2025-05-24 01:45:43.473218+00');
INSERT INTO public.dashboard_configs VALUES (23, 1, '{"widgets": [{"id": "custom-widget-1748051153852", "type": "table", "title": "capacity Summary", "width": 1, "position": 5}, {"id": "custom-widget-1748052966585", "type": "pie-chart", "title": "Sales Distribution", "width": 1, "position": 2}]}', '2025-05-24 02:15:56.310943+00');
INSERT INTO public.dashboard_configs VALUES (24, 1, '{"widgets": [{"id": "custom-widget-1748051153852", "type": "table", "title": "capacity Summary", "width": 1, "position": 5}]}', '2025-05-26 13:07:16.942616+00');
INSERT INTO public.dashboard_configs VALUES (25, 1, '{"widgets": []}', '2025-05-26 13:07:19.817058+00');
INSERT INTO public.dashboard_configs VALUES (26, 1, '{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 1}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-26 13:07:33.498415+00');
INSERT INTO public.dashboard_configs VALUES (27, 1, '{"widgets": [{"id": "default-top-products", "type": "top-products", "title": "Top Selling Products", "width": 1, "position": 0}, {"id": "default-sales-overview", "type": "sales-overview", "title": "Sales Overview", "width": 2, "position": 1}, {"id": "default-inventory-status", "type": "inventory-status", "title": "Inventory Status", "width": 1, "position": 2}, {"id": "default-recent-activity", "type": "recent-activity", "title": "Recent Activity", "width": 1, "position": 3}]}', '2025-05-26 13:39:00.668615+00');
INSERT INTO public.dashboard_configs VALUES (28, 1, '{"widgets": [{"id": "custom-widget-1748266778139", "type": "table", "title": "capacity Summary", "width": 1, "position": 1}]}', '2025-05-26 13:39:27.580284+00');
INSERT INTO public.dashboard_configs VALUES (29, 1, '{"widgets": []}', '2025-05-26 13:39:36.825973+00');


--
-- Data for Name: employee_master; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.employees VALUES (1, 'E1001', 'John', 'Smith', 'john.smith@minierp.com', '212-555-1234', 'Executive', 'CEO', 1, NULL, '2018-01-15', NULL, true, '2025-05-20 22:10:30.210641', '2025-05-20 22:10:30.210641');
INSERT INTO public.employees VALUES (2, 'E1002', 'Sarah', 'Johnson', 'sarah.johnson@minierp.com', '212-555-2345', 'Finance', 'CFO', 1, NULL, '2018-02-01', NULL, true, '2025-05-20 22:10:30.210641', '2025-05-20 22:10:30.210641');
INSERT INTO public.employees VALUES (3, 'E1003', 'Michael', 'Williams', 'michael.williams@minierp.com', '212-555-3456', 'Operations', 'COO', 1, NULL, '2018-03-15', NULL, true, '2025-05-20 22:10:30.210641', '2025-05-20 22:10:30.210641');
INSERT INTO public.employees VALUES (4, 'E1004', 'David', 'Brown', 'david.brown@minierp.com', '212-555-4567', 'Manufacturing', 'VP Manufacturing', 1, NULL, '2018-06-01', NULL, true, '2025-05-20 22:10:30.210641', '2025-05-20 22:10:30.210641');
INSERT INTO public.employees VALUES (5, 'E1005', 'Jennifer', 'Davis', 'jennifer.davis@minierp.com', '212-555-5678', 'Sales', 'VP Sales', 1, NULL, '2018-07-15', NULL, true, '2025-05-20 22:10:30.210641', '2025-05-20 22:10:30.210641');
INSERT INTO public.employees VALUES (8, 'US01-EMP2769', 'Emma', 'Johnson', 'emma.johnson1@example.com', '+1-555-987-8217', 'Sales', 'Sales Manager', 1, 3, '2019-07-22', NULL, true, '2025-05-21 14:58:58.925057', '2025-05-21 14:58:58.925057');
INSERT INTO public.employees VALUES (9, 'EU01-EMP9748', 'Emma', 'Johnson', 'emma.johnson2@example.com', '+1-555-987-8928', 'Sales', 'Sales Manager', 2, NULL, '2019-07-22', NULL, true, '2025-05-21 14:58:58.925057', '2025-05-21 14:58:58.925057');
INSERT INTO public.employees VALUES (10, 'TEST02-EMP9857', 'Emma', 'Johnson', 'emma.johnson4@example.com', '+1-555-987-1855', 'Sales', 'Sales Manager', 4, NULL, '2019-07-22', NULL, true, '2025-05-21 14:58:58.925057', '2025-05-21 14:58:58.925057');
INSERT INTO public.employees VALUES (11, 'CA01-EMP8109', 'Emma', 'Johnson', 'emma.johnson5@example.com', '+1-555-987-5968', 'Sales', 'Sales Manager', 5, 13, '2019-07-22', NULL, true, '2025-05-21 14:58:58.925057', '2025-05-21 14:58:58.925057');
INSERT INTO public.employees VALUES (12, 'GA01-EMP6705', 'Emma', 'Johnson', 'emma.johnson7@example.com', '+1-555-987-5673', 'Sales', 'Sales Manager', 7, 15, '2019-07-22', NULL, true, '2025-05-21 14:58:58.925057', '2025-05-21 14:58:58.925057');


--
-- Data for Name: environment_config; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: erp_customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.erp_customers VALUES (1, 'C1001', 'Acme Corporation', 'corporate', 'Large manufacturing client', '123-45-6789', 'manufacturing', 'enterprise', '123 Main Street', 'Chicago', 'IL', 'US', '60601', NULL, '+1-312-555-1234', NULL, 'contact@acmecorp.com', NULL, 'USD', 'net_30', NULL, 50000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, true, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (2, 'C1002', 'Global Retailers', 'corporate', 'International retail chain', '987-65-4321', 'retail', 'key_account', '456 Market Ave', 'New York', 'NY', 'US', '10001', NULL, '+1-212-555-2345', NULL, 'orders@globalretail.com', NULL, 'USD', 'net_45', NULL, 100000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, true, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (3, 'C1003', 'City Hospital', 'corporate', 'Regional medical center', '456-78-9012', 'healthcare', 'mid_market', '789 Health Blvd', 'Boston', 'MA', 'US', '02110', NULL, '+1-617-555-3456', NULL, 'procurement@cityhospital.org', NULL, 'USD', 'net_60', NULL, 75000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, false, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (4, 'C1004', 'Tech Innovations', 'corporate', 'Technology startup', '789-01-2345', 'technology', 'small_business', '321 Tech Park', 'San Francisco', 'CA', 'US', '94105', NULL, '+1-415-555-4567', NULL, 'orders@techinnovate.com', NULL, 'USD', 'net_30', NULL, 25000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, false, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (5, 'C1005', 'John Smith', 'individual', 'Regular customer', NULL, NULL, 'consumer', '555 Residential St', 'Los Angeles', 'CA', 'US', '90001', NULL, '+1-213-555-5678', NULL, 'john.smith@email.com', NULL, 'USD', 'prepaid', NULL, 1000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', false, true, false, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (6, 'C1006', 'Government Agency', 'government', 'Federal procurement office', 'GOV-123456', 'government', 'enterprise', '1 Federal Plaza', 'Washington', 'DC', 'US', '20001', NULL, '+1-202-555-6789', NULL, 'procurement@gov.agency.gov', NULL, 'USD', 'net_60', NULL, 500000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, false, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (7, 'C1007', 'European Distributors', 'corporate', 'European distribution partner', 'EU-8765432', 'distribution', 'strategic', '10 International Blvd', 'Berlin', NULL, 'DE', '10115', NULL, '+49-30-555-7890', NULL, 'orders@eurodist.eu', NULL, 'EUR', 'net_45', NULL, 200000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, true, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (8, 'C1008', 'Education Foundation', 'non_profit', 'Educational institution', 'TAX-EXEMPT-123', 'education', 'mid_market', '200 Learning Way', 'Atlanta', 'GA', 'US', '30301', NULL, '+1-404-555-8901', NULL, 'purchases@edufoundation.org', NULL, 'USD', 'net_30', NULL, 30000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, false, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (9, 'C1009', 'Local Restaurant', 'corporate', 'Small business customer', 'BUS-987654', 'food_service', 'small_business', '75 Culinary Lane', 'Miami', 'FL', 'US', '33101', NULL, '+1-305-555-9012', NULL, 'orders@localrestaurant.com', NULL, 'USD', 'cod', NULL, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, false, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);
INSERT INTO public.erp_customers VALUES (10, 'C1010', 'Industrial Supplies', 'corporate', 'Industrial equipment supplier', 'IND-456789', 'industrial', 'mid_market', '800 Factory Road', 'Detroit', 'MI', 'US', '48201', NULL, '+1-313-555-0123', NULL, 'sales@industrialsupplies.com', NULL, 'USD', 'net_30', NULL, 150000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', true, false, false, NULL, NULL, 2, true, '2025-05-17 15:45:52.538438', '2025-05-17 15:45:52.538438', NULL, NULL, 1);


--
-- Data for Name: erp_customer_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.erp_customer_contacts VALUES (1, 1, 'James', 'Wilson', 'Purchasing Manager', 'Procurement', 'james.wilson@acmecorp.com', '+1-312-555-1235', NULL, true, false, false, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (2, 1, 'Sarah', 'Johnson', 'Accounts Payable Manager', 'Finance', 'sarah.johnson@acmecorp.com', '+1-312-555-1236', NULL, false, true, false, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (3, 1, 'Robert', 'Davis', 'Logistics Coordinator', 'Operations', 'robert.davis@acmecorp.com', '+1-312-555-1237', NULL, false, false, true, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (4, 2, 'Michael', 'Brown', 'Director of Merchandising', 'Purchasing', 'michael.brown@globalretail.com', '+1-212-555-2346', NULL, true, true, false, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (5, 2, 'Emily', 'Taylor', 'Supply Chain Manager', 'Operations', 'emily.taylor@globalretail.com', '+1-212-555-2347', NULL, false, false, true, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (6, 3, 'David', 'Martinez', 'Head of Procurement', 'Administration', 'david.martinez@cityhospital.org', '+1-617-555-3457', NULL, true, true, true, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (7, 4, 'Lisa', 'Anderson', 'Operations Director', 'Operations', 'lisa.anderson@techinnovate.com', '+1-415-555-4568', NULL, true, true, true, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (8, 6, 'Thomas', 'Washington', 'Procurement Officer', 'Acquisitions', 'thomas.washington@gov.agency.gov', '+1-202-555-6790', NULL, true, false, false, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (9, 6, 'Jennifer', 'Adams', 'Financial Officer', 'Finance', 'jennifer.adams@gov.agency.gov', '+1-202-555-6791', NULL, false, true, false, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);
INSERT INTO public.erp_customer_contacts VALUES (10, 7, 'Klaus', 'Schmidt', 'International Sales Director', 'Sales', 'klaus.schmidt@eurodist.eu', '+49-30-555-7891', NULL, true, true, true, false, false, 'English', NULL, true, '2025-05-17 15:46:05.273222', '2025-05-17 15:46:05.273222', NULL, NULL);


--
-- Data for Name: erp_vendors; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.erp_vendors VALUES (1, 'V1001', 'Prime Steel Supply', 'supplier', 'Steel and metal supplier', 'PS-12345', 'manufacturing', '100 Industrial Road', 'Pittsburgh', 'PA', 'US', '15222', NULL, '+1-412-555-1111', NULL, 'orders@primesteelsupply.com', NULL, 'USD', 'net_30', NULL, 'manufacturer', 'strategic', NULL, NULL, 92, 14, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (2, 'V1002', 'Quality Electronics', 'supplier', 'Electronic components supplier', 'QE-67890', 'electronics', '200 Tech Avenue', 'San Jose', 'CA', 'US', '95110', NULL, '+1-408-555-2222', NULL, 'sales@qualityelectronics.com', NULL, 'USD', 'net_45', NULL, 'distributor', 'preferred', NULL, NULL, 88, 21, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (3, 'V1003', 'Global Logistics', 'service_provider', 'International shipping and logistics', 'GL-34567', 'transportation', '300 Harbor Blvd', 'Long Beach', 'CA', 'US', '90802', NULL, '+1-562-555-3333', NULL, 'operations@globallogistics.com', NULL, 'USD', 'net_30', NULL, 'service', 'approved', NULL, NULL, 95, 7, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (4, 'V1004', 'Advanced Materials', 'supplier', 'Specialized manufacturing materials', 'AM-89012', 'chemicals', '400 Research Parkway', 'Raleigh', 'NC', 'US', '27601', NULL, '+1-919-555-4444', NULL, 'orders@advancedmaterials.com', NULL, 'USD', 'net_60', NULL, 'manufacturer', 'strategic', NULL, NULL, 90, 28, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (5, 'V1005', 'Precision Engineering', 'contractor', 'Custom tooling and machining services', 'PE-45678', 'manufacturing', '500 Precision Way', 'Cincinnati', 'OH', 'US', '45202', NULL, '+1-513-555-5555', NULL, 'info@precisionengineering.com', NULL, 'USD', 'net_30', NULL, 'service', 'preferred', NULL, NULL, 87, 35, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (6, 'V1006', 'Packaging Solutions', 'supplier', 'Industrial packaging materials', 'PS-90123', 'packaging', '600 Box Street', 'Memphis', 'TN', 'US', '38101', NULL, '+1-901-555-6666', NULL, 'sales@packagingsolutions.com', NULL, 'USD', 'net_30', NULL, 'manufacturer', 'approved', NULL, NULL, 83, 10, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (7, 'V1007', 'Machinery Maintenance', 'service_provider', 'Equipment maintenance and repair', 'MM-56789', 'services', '700 Service Road', 'Cleveland', 'OH', 'US', '44101', NULL, '+1-216-555-7777', NULL, 'service@machinerymaintenance.com', NULL, 'USD', 'net_15', NULL, 'service', 'approved', NULL, NULL, 79, 3, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (8, 'V1008', 'Asian Manufacturing', 'supplier', 'Overseas manufacturing partner', 'AM-901234', 'manufacturing', '800 Export Zone', 'Shenzhen', NULL, 'CN', '518000', NULL, '+86-755-5558888', NULL, 'exports@asianmanufacturing.com', NULL, 'USD', 'letter_of_credit', NULL, 'manufacturer', 'strategic', NULL, NULL, 85, 45, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (9, 'V1009', 'Office Supplies Co', 'supplier', 'General office and facility supplies', 'OSC-12345', 'retail', '900 Retail Row', 'Chicago', 'IL', 'US', '60602', NULL, '+1-312-555-9999', NULL, 'orders@officesupplies.com', NULL, 'USD', 'net_30', NULL, 'distributor', 'approved', NULL, NULL, 82, 5, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (10, 'V1010', 'Unreliable Vendor', 'supplier', 'Problematic supplier with quality issues', 'UV-99999', 'manufacturing', '1000 Problem Street', 'Phoenix', 'AZ', 'US', '85001', NULL, '+1-602-555-0000', NULL, 'orders@unreliablevendor.com', NULL, 'USD', 'advance', NULL, 'manufacturer', 'one_time', NULL, NULL, 30, 60, NULL, 'inactive', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (11, 'V1011', 'Blacklisted Supply', 'supplier', 'Blacklisted due to contract violations', 'BS-00000', 'manufacturing', '1100 Violation Road', 'Denver', 'CO', 'US', '80201', NULL, '+1-303-555-1111', NULL, 'info@blacklistedsupply.com', NULL, 'USD', 'cod', NULL, 'manufacturer', 'one_time', NULL, NULL, 10, 90, NULL, 'blocked', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);
INSERT INTO public.erp_vendors VALUES (12, 'V1012', 'Software Solutions', 'service_provider', 'Software and IT services provider', 'SS-12345', 'technology', '1200 Code Boulevard', 'Seattle', 'WA', 'US', '98101', NULL, '+1-206-555-2222', NULL, 'services@softwaresolutions.com', NULL, 'USD', 'net_30', NULL, 'service', 'strategic', NULL, NULL, 91, 14, NULL, 'active', false, NULL, NULL, NULL, 2, true, '2025-05-17 15:46:35.531383', '2025-05-17 15:46:35.531383', NULL, NULL, 1);


--
-- Data for Name: erp_vendor_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.erp_vendor_contacts VALUES (1, 1, 'Richard', 'Steel', 'Sales Director', 'Sales', 'richard.steel@primesteelsupply.com', '+1-412-555-1112', NULL, true, true, false, false, false, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (2, 1, 'Patricia', 'Miller', 'Accounts Manager', 'Finance', 'patricia.miller@primesteelsupply.com', '+1-412-555-1113', NULL, false, false, false, false, true, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (3, 2, 'Edward', 'Johnson', 'VP of Sales', 'Sales', 'edward.johnson@qualityelectronics.com', '+1-408-555-2223', NULL, true, true, false, false, false, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (4, 2, 'Michelle', 'Lee', 'Customer Relations', 'Customer Service', 'michelle.lee@qualityelectronics.com', '+1-408-555-2224', NULL, false, false, false, false, true, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (5, 3, 'Carlos', 'Rodriguez', 'Operations Manager', 'Operations', 'carlos.rodriguez@globallogistics.com', '+1-562-555-3334', NULL, true, true, false, false, true, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (6, 4, 'Stephanie', 'Clark', 'Sales Representative', 'Sales', 'stephanie.clark@advancedmaterials.com', '+1-919-555-4445', NULL, true, true, false, false, false, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (7, 4, 'Mark', 'Williams', 'Technical Support', 'Engineering', 'mark.williams@advancedmaterials.com', '+1-919-555-4446', NULL, false, false, false, false, false, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (8, 5, 'Gregory', 'Phillips', 'Owner', 'Management', 'gregory.phillips@precisionengineering.com', '+1-513-555-5556', NULL, true, true, false, false, true, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (9, 8, 'Mei', 'Chen', 'Export Manager', 'International Sales', 'mei.chen@asianmanufacturing.com', '+86-755-5558889', NULL, true, true, false, false, false, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (10, 8, 'Jian', 'Zhang', 'Quality Control Manager', 'Quality', 'jian.zhang@asianmanufacturing.com', '+86-755-5558890', NULL, false, false, false, false, true, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (11, 12, 'Brian', 'Davis', 'Account Executive', 'Sales', 'brian.davis@softwaresolutions.com', '+1-206-555-2223', NULL, true, true, false, false, false, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);
INSERT INTO public.erp_vendor_contacts VALUES (12, 12, 'Amanda', 'Wilson', 'Support Manager', 'Technical Support', 'amanda.wilson@softwaresolutions.com', '+1-206-555-2224', NULL, false, false, false, false, true, 'English', NULL, true, '2025-05-17 15:46:49.348119', '2025-05-17 15:46:49.348119', NULL, NULL);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.expenses VALUES (4, '2025-04-07 13:40:07.532', 4497.31, 'Professional Services', 'Consulting and professional fees', 'Credit Card', 'EXP-7870', 1, '2025-05-22 13:40:07.533', '2025-05-22 13:40:07.533');
INSERT INTO public.expenses VALUES (5, '2025-03-02 13:40:07.532', 4652.64, 'Software', 'Software licenses and subscriptions', 'Petty Cash', 'EXP-7268', 1, '2025-05-22 13:40:07.575', '2025-05-22 13:40:07.575');
INSERT INTO public.expenses VALUES (6, '2025-03-18 13:40:07.532', 1942.11, 'Training', 'Employee training and development', 'Credit Card', 'EXP-0984', 1, '2025-05-22 13:40:07.599', '2025-05-22 13:40:07.599');
INSERT INTO public.expenses VALUES (7, '2025-05-06 13:40:07.532', 2303.66, 'Marketing', 'Marketing campaign expenses', 'Credit Card', 'EXP-3024', 1, '2025-05-22 13:40:07.617', '2025-05-22 13:40:07.617');
INSERT INTO public.expenses VALUES (8, '2025-05-14 13:40:07.532', 4140.1, 'Utilities', 'Monthly utility bills', 'Petty Cash', 'EXP-7523', 1, '2025-05-22 13:40:07.635', '2025-05-22 13:40:07.635');
INSERT INTO public.expenses VALUES (9, '2025-05-14 13:40:07.532', 3782.49, 'Maintenance', 'Equipment and building maintenance', 'Cash', 'EXP-0422', 1, '2025-05-22 13:40:07.654', '2025-05-22 13:40:07.654');
INSERT INTO public.expenses VALUES (10, '2025-03-02 13:40:07.532', 3939.37, 'Hardware', 'Computer and office equipment', 'Corporate Card', 'EXP-1328', 1, '2025-05-22 13:40:07.68', '2025-05-22 13:40:07.68');
INSERT INTO public.expenses VALUES (11, '2025-02-27 13:40:07.532', 2907.45, 'Office Supplies', 'Office stationery and supplies', 'PayPal', 'EXP-6739', 1, '2025-05-22 13:40:07.71', '2025-05-22 13:40:07.71');
INSERT INTO public.expenses VALUES (12, '2025-04-11 13:40:07.532', 4389.24, 'Office Supplies', 'Office stationery and supplies', 'PayPal', 'EXP-4371', 1, '2025-05-22 13:40:07.731', '2025-05-22 13:40:07.731');
INSERT INTO public.expenses VALUES (13, '2025-04-21 13:40:07.532', 2628.29, 'Marketing', 'Marketing campaign expenses', 'Bank Transfer', 'EXP-1703', 1, '2025-05-22 13:40:07.75', '2025-05-22 13:40:07.75');
INSERT INTO public.expenses VALUES (14, '2025-05-16 13:40:07.532', 1210.63, 'Office Supplies', 'Office stationery and supplies', 'Corporate Card', 'EXP-5873', 1, '2025-05-22 13:40:07.768', '2025-05-22 13:40:07.768');
INSERT INTO public.expenses VALUES (15, '2025-03-15 13:40:07.532', 2723.74, 'Software', 'Software licenses and subscriptions', 'Check', 'EXP-6857', 1, '2025-05-22 13:40:07.788', '2025-05-22 13:40:07.788');
INSERT INTO public.expenses VALUES (16, '2025-03-26 13:40:07.532', 1338.37, 'Software', 'Software licenses and subscriptions', 'PayPal', 'EXP-4754', 1, '2025-05-22 13:40:07.808', '2025-05-22 13:40:07.808');
INSERT INTO public.expenses VALUES (17, '2025-05-07 13:40:07.532', 1939.2, 'Professional Services', 'Consulting and professional fees', 'Bank Transfer', 'EXP-5327', 1, '2025-05-22 13:40:07.826', '2025-05-22 13:40:07.826');
INSERT INTO public.expenses VALUES (18, '2025-03-22 13:40:07.532', 1458.69, 'Office Supplies', 'Office stationery and supplies', 'Cash', 'EXP-7187', 1, '2025-05-22 13:40:07.857', '2025-05-22 13:40:07.857');


--
-- Data for Name: fiscal_periods; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.fiscal_periods VALUES (1, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 1, '2025-01', '2025-01-01', '2025-01-31', 'CLOSED', 1);
INSERT INTO public.fiscal_periods VALUES (2, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 2, '2025-02', '2025-02-01', '2025-02-28', 'CLOSED', 1);
INSERT INTO public.fiscal_periods VALUES (3, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 3, '2025-03', '2025-03-01', '2025-03-31', 'CLOSED', 1);
INSERT INTO public.fiscal_periods VALUES (4, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 4, '2025-04', '2025-04-01', '2025-04-30', 'CLOSED', 1);
INSERT INTO public.fiscal_periods VALUES (5, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 5, '2025-05', '2025-05-01', '2025-05-31', 'CLOSED', 1);
INSERT INTO public.fiscal_periods VALUES (6, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 6, '2025-06', '2025-06-01', '2025-06-30', 'OPEN', 1);
INSERT INTO public.fiscal_periods VALUES (7, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 7, '2025-07', '2025-07-01', '2025-07-31', 'OPEN', 1);
INSERT INTO public.fiscal_periods VALUES (8, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 8, '2025-08', '2025-08-01', '2025-08-31', 'OPEN', 1);
INSERT INTO public.fiscal_periods VALUES (9, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 9, '2025-09', '2025-09-01', '2025-09-30', 'OPEN', 1);
INSERT INTO public.fiscal_periods VALUES (10, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 10, '2025-10', '2025-10-01', '2025-10-31', 'OPEN', 1);
INSERT INTO public.fiscal_periods VALUES (11, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 11, '2025-11', '2025-11-01', '2025-11-30', 'OPEN', 1);
INSERT INTO public.fiscal_periods VALUES (12, '2025-05-20 22:11:27.296074', '2025-05-20 22:11:27.296074', 1, 2025, 12, '2025-12', '2025-12-01', '2025-12-31', 'OPEN', 1);


--
-- Data for Name: general_ledger_accounts; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: gl_accounts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.gl_accounts VALUES (1, '1000', 'Cash and Cash Equivalents', 39, 'ASSETS', 'CURRENT_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (2, '1100', 'Accounts Receivable', 39, 'ASSETS', 'CURRENT_ASSETS', true, false, false, true, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (3, '1110', 'Allowance for Doubtful Accounts', 39, 'ASSETS', 'CURRENT_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (4, '1200', 'Inventory - Raw Materials', 39, 'ASSETS', 'CURRENT_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (5, '1210', 'Inventory - Work in Process', 39, 'ASSETS', 'CURRENT_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (6, '1220', 'Inventory - Finished Goods', 39, 'ASSETS', 'CURRENT_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (7, '1300', 'Prepaid Expenses', 39, 'ASSETS', 'CURRENT_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (8, '1500', 'Property, Plant & Equipment', 39, 'ASSETS', 'FIXED_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (9, '1510', 'Accumulated Depreciation - PPE', 39, 'ASSETS', 'FIXED_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (10, '1600', 'Intangible Assets', 39, 'ASSETS', 'FIXED_ASSETS', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (11, '2000', 'Accounts Payable', 39, 'LIABILITIES', 'CURRENT_LIABILITIES', true, false, false, true, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (12, '2100', 'Accrued Expenses', 39, 'LIABILITIES', 'CURRENT_LIABILITIES', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (13, '2110', 'Accrued Payroll', 39, 'LIABILITIES', 'CURRENT_LIABILITIES', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (14, '2200', 'Short-term Debt', 39, 'LIABILITIES', 'CURRENT_LIABILITIES', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (15, '2300', 'Income Tax Payable', 39, 'LIABILITIES', 'CURRENT_LIABILITIES', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (16, '2500', 'Long-term Debt', 39, 'LIABILITIES', 'LONG_TERM_LIABILITIES', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (17, '3000', 'Common Stock', 39, 'EQUITY', 'STOCKHOLDERS_EQUITY', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (18, '3100', 'Retained Earnings', 39, 'EQUITY', 'STOCKHOLDERS_EQUITY', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (19, '3200', 'Additional Paid-in Capital', 39, 'EQUITY', 'STOCKHOLDERS_EQUITY', true, false, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (20, '4000', 'Sales Revenue - Products', 39, 'REVENUE', 'OPERATING_REVENUE', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (21, '4100', 'Service Revenue', 39, 'REVENUE', 'OPERATING_REVENUE', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (22, '4200', 'Other Operating Revenue', 39, 'REVENUE', 'OTHER_REVENUE', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (23, '5000', 'Cost of Goods Sold - Materials', 39, 'EXPENSES', 'COST_OF_SALES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (24, '5100', 'Cost of Goods Sold - Labor', 39, 'EXPENSES', 'COST_OF_SALES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (25, '5200', 'Cost of Goods Sold - Overhead', 39, 'EXPENSES', 'COST_OF_SALES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (26, '6000', 'Salaries and Wages', 39, 'EXPENSES', 'OPERATING_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (27, '6100', 'Rent Expense', 39, 'EXPENSES', 'OPERATING_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (28, '6200', 'Utilities Expense', 39, 'EXPENSES', 'OPERATING_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (29, '6300', 'Depreciation Expense', 39, 'EXPENSES', 'OPERATING_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (30, '6400', 'Insurance Expense', 39, 'EXPENSES', 'OPERATING_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (31, '6500', 'Marketing and Advertising', 39, 'EXPENSES', 'OPERATING_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (32, '6600', 'Research and Development', 39, 'EXPENSES', 'OPERATING_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (33, '7000', 'Interest Expense', 39, 'EXPENSES', 'NON_OPERATING_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (34, '7100', 'Interest Income', 39, 'REVENUE', 'NON_OPERATING_REVENUE', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');
INSERT INTO public.gl_accounts VALUES (35, '8000', 'Income Tax Expense', 39, 'EXPENSES', 'TAX_EXPENSES', false, true, false, false, true, '2025-06-04 02:38:20.681585', '2025-06-04 02:38:20.681585');


--
-- Data for Name: internal_orders; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: storage_locations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.storage_locations VALUES (13, 'SL001', 'Raw Materials Warehouse', 'Primary storage for raw materials in main factory', 1, 'raw_material', true, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.094952', NULL, '2025-05-20 05:01:14.094952', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (14, 'SL002', 'Work-in-Progress', 'Temporary storage for work-in-progress items', 1, 'wip', true, false, false, false, false, false, false, 'active', true, '2025-05-20 05:01:14.125555', NULL, '2025-05-20 05:01:14.125555', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (15, 'SL003', 'Finished Goods', 'Storage for completed products ready for shipping', 1, 'finished_goods', true, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.149165', NULL, '2025-05-20 05:01:14.149165', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (16, 'SL004', 'Quality Control Area', 'Area for quality inspection and testing', 1, 'quality_control', false, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.170727', NULL, '2025-05-20 05:01:14.170727', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (17, 'SL005', 'Components Storage', 'Storage for assembly components and parts', 3, 'components', true, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.195182', NULL, '2025-05-20 05:01:14.195182', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (18, 'SL006', 'Assembly WIP', 'Work-in-progress area for assembly operations', 3, 'wip', true, false, false, false, false, false, false, 'active', true, '2025-05-20 05:01:14.215786', NULL, '2025-05-20 05:01:14.215786', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (19, 'SL007', 'Berlin Raw Materials', 'Raw material storage for Berlin plant', 5, 'raw_material', true, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.233335', NULL, '2025-05-20 05:01:14.233335', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (20, 'SL008', 'Berlin Finished Goods', 'Finished product storage for Berlin plant', 5, 'finished_goods', true, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.250899', NULL, '2025-05-20 05:01:14.250899', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (21, 'SL009', 'Shanghai Materials', 'Raw material storage for Shanghai facility', 6, 'raw_material', true, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.273873', NULL, '2025-05-20 05:01:14.273873', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (22, 'SL010', 'Shanghai Finished Goods', 'Finished product storage for Shanghai facility', 6, 'finished_goods', true, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.293642', NULL, '2025-05-20 05:01:14.293642', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (23, 'SL011', 'US Distribution - Zone A', 'High-volume products distribution area', 2, 'distribution', false, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.314699', NULL, '2025-05-20 05:01:14.314699', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (24, 'SL012', 'US Distribution - Zone B', 'Specialty products distribution area', 2, 'distribution', false, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.339057', NULL, '2025-05-20 05:01:14.339057', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (25, 'SL013', 'European Warehouse - General', 'General storage area for European warehouse', 7, 'distribution', false, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.365961', NULL, '2025-05-20 05:01:14.365961', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (26, 'SL014', 'European Warehouse - Cold Storage', 'Temperature-controlled storage area', 7, 'special_handling', false, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.386335', NULL, '2025-05-20 05:01:14.386335', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (27, 'SL015', 'Asia Distribution - General', 'General storage area for Asian distribution hub', 8, 'distribution', false, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.408615', NULL, '2025-05-20 05:01:14.408615', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (28, 'SL016', 'UK Warehouse - Main', 'Main storage area for UK warehouse', 9, 'distribution', false, false, false, true, false, false, false, 'active', true, '2025-05-20 05:01:14.426302', NULL, '2025-05-20 05:01:14.426302', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (29, 'SL017', 'Hazardous Materials', 'Special storage for hazardous materials', 1, 'hazardous', true, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.444301', NULL, '2025-05-20 05:01:14.444301', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (30, 'SL018', 'Returns Processing', 'Area for processing customer returns', 2, 'returns', false, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.465474', NULL, '2025-05-20 05:01:14.465474', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (31, 'SL019', 'Maintenance Supplies', 'Storage for maintenance tools and supplies', 1, 'maintenance', false, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.484431', NULL, '2025-05-20 05:01:14.484431', NULL, 1, NULL);
INSERT INTO public.storage_locations VALUES (32, 'SL020', 'Packaging Materials', 'Storage for packaging materials and supplies', 1, 'packaging', true, false, true, false, false, false, false, 'active', true, '2025-05-20 05:01:14.506819', NULL, '2025-05-20 05:01:14.506819', NULL, 1, NULL);


--
-- Data for Name: inventory_transactions; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.orders VALUES (3, 'SO-10000', 5, '2025-02-11 07:25:12.502', 'DELIVERED', 7469.740000000001, 'Sample order 1 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:35.988', '2025-05-21 16:29:35.988');
INSERT INTO public.orders VALUES (4, 'SO-10001', 1, '2025-05-13 05:02:26.31', 'CONFIRMED', 2449.9300000000003, 'Sample order 2 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:36.13', '2025-05-21 16:29:36.13');
INSERT INTO public.orders VALUES (5, 'SO-10002', 5, '2025-04-24 07:05:56.36', 'DRAFT', 9999.9, 'Sample order 3 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:36.178', '2025-05-21 16:29:36.178');
INSERT INTO public.orders VALUES (6, 'SO-10003', 3, '2025-03-01 02:13:26.649', 'DRAFT', 2309.8100000000004, 'Sample order 4 for European Distributors Ltd', 'Shipping to European Distributors Ltd at their registered address', NULL, '2025-05-21 16:29:36.225', '2025-05-21 16:29:36.225');
INSERT INTO public.orders VALUES (7, 'SO-10004', 2, '2025-02-04 03:01:03.697', 'CONFIRMED', 3499.9, 'Sample order 5 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:36.304', '2025-05-21 16:29:36.304');
INSERT INTO public.orders VALUES (8, 'SO-10005', 5, '2025-02-11 09:32:58.133', 'DRAFT', 2649.81, 'Sample order 6 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:36.352', '2025-05-21 16:29:36.352');
INSERT INTO public.orders VALUES (9, 'SO-10006', 1, '2024-12-31 19:00:58.283', 'DRAFT', 2079.9300000000003, 'Sample order 7 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:36.431', '2025-05-21 16:29:36.431');
INSERT INTO public.orders VALUES (10, 'SO-10007', 3, '2025-05-13 13:56:33.214', 'PROCESSING', 389.97, 'Sample order 8 for European Distributors Ltd', 'Shipping to European Distributors Ltd at their registered address', NULL, '2025-05-21 16:29:36.493', '2025-05-21 16:29:36.493');
INSERT INTO public.orders VALUES (11, 'SO-10008', 5, '2025-04-02 01:46:56.499', 'DRAFT', 4689.81, 'Sample order 9 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:36.541', '2025-05-21 16:29:36.541');
INSERT INTO public.orders VALUES (12, 'SO-10009', 1, '2025-05-17 16:51:54.19', 'DRAFT', 5119.7, 'Sample order 10 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:36.622', '2025-05-21 16:29:36.622');
INSERT INTO public.orders VALUES (13, 'SO-10010', 1, '2025-02-08 11:36:41.019', 'CONFIRMED', 779.94, 'Sample order 11 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:36.727', '2025-05-21 16:29:36.727');
INSERT INTO public.orders VALUES (14, 'SO-10011', 1, '2025-03-25 04:45:53.561', 'CONFIRMED', 3669.83, 'Sample order 12 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:36.774', '2025-05-21 16:29:36.774');
INSERT INTO public.orders VALUES (15, 'SO-10012', 2, '2025-04-25 09:54:02.31', 'DRAFT', 2649.9300000000003, 'Sample order 13 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:36.854', '2025-05-21 16:29:36.854');
INSERT INTO public.orders VALUES (16, 'SO-10013', 2, '2025-02-26 11:17:58.421', 'CONFIRMED', 5299.89, 'Sample order 14 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:36.917', '2025-05-21 16:29:36.917');
INSERT INTO public.orders VALUES (17, 'SO-10014', 5, '2024-12-31 20:35:27.996', 'DRAFT', 849.9100000000001, 'Sample order 15 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:36.979', '2025-05-21 16:29:36.979');
INSERT INTO public.orders VALUES (18, 'SO-10015', 5, '2025-05-12 17:12:33.098', 'CONFIRMED', 4299.93, 'Sample order 16 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:37.042', '2025-05-21 16:29:37.042');
INSERT INTO public.orders VALUES (19, 'SO-10016', 3, '2025-05-13 20:10:12.347', 'DRAFT', 3159.78, 'Sample order 17 for European Distributors Ltd', 'Shipping to European Distributors Ltd at their registered address', NULL, '2025-05-21 16:29:37.121', '2025-05-21 16:29:37.121');
INSERT INTO public.orders VALUES (20, 'SO-10017', 4, '2025-05-01 21:09:29.634', 'DELIVERED', 11439.71, 'Sample order 18 for Tech Solutions GmbH', 'Shipping to Tech Solutions GmbH at their registered address', NULL, '2025-05-21 16:29:37.218', '2025-05-21 16:29:37.218');
INSERT INTO public.orders VALUES (21, 'SO-10018', 4, '2024-11-22 16:16:12.929', 'DRAFT', 2969.83, 'Sample order 19 for Tech Solutions GmbH', 'Shipping to Tech Solutions GmbH at their registered address', NULL, '2025-05-21 16:29:37.344', '2025-05-21 16:29:37.344');
INSERT INTO public.orders VALUES (22, 'SO-10019', 1, '2025-05-14 07:41:52.633', 'DRAFT', 3199.9300000000003, 'Sample order 20 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:37.416', '2025-05-21 16:29:37.416');
INSERT INTO public.orders VALUES (23, 'SO-10020', 3, '2024-11-23 20:26:31.944', 'DRAFT', 19399.72, 'Sample order 21 for European Distributors Ltd', 'Shipping to European Distributors Ltd at their registered address', NULL, '2025-05-21 16:29:37.484', '2025-05-21 16:29:37.484');
INSERT INTO public.orders VALUES (24, 'SO-10021', 2, '2025-04-06 06:02:00.824', 'PROCESSING', 1039.92, 'Sample order 22 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:37.562', '2025-05-21 16:29:37.562');
INSERT INTO public.orders VALUES (25, 'SO-10022', 3, '2025-04-18 03:56:30.454', 'DRAFT', 2939.82, 'Sample order 23 for European Distributors Ltd', 'Shipping to European Distributors Ltd at their registered address', NULL, '2025-05-21 16:29:37.609', '2025-05-21 16:29:37.609');
INSERT INTO public.orders VALUES (26, 'SO-10023', 1, '2024-12-28 18:43:15.488', 'DELIVERED', 2289.85, 'Sample order 24 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:37.689', '2025-05-21 16:29:37.689');
INSERT INTO public.orders VALUES (27, 'SO-10024', 4, '2025-04-01 03:12:19.304', 'SHIPPED', 5399.91, 'Sample order 25 for Tech Solutions GmbH', 'Shipping to Tech Solutions GmbH at their registered address', NULL, '2025-05-21 16:29:37.801', '2025-05-21 16:29:37.801');
INSERT INTO public.orders VALUES (28, 'SO-10025', 1, '2024-12-17 00:56:14.765', 'PROCESSING', 1889.93, 'Sample order 26 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:37.863', '2025-05-21 16:29:37.863');
INSERT INTO public.orders VALUES (29, 'SO-10026', 1, '2025-04-09 15:27:28.084', 'PROCESSING', 5039.889999999999, 'Sample order 27 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:37.941', '2025-05-21 16:29:37.941');
INSERT INTO public.orders VALUES (30, 'SO-10027', 1, '2025-03-05 08:43:30.987', 'PROCESSING', 3399.92, 'Sample order 28 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:38.003', '2025-05-21 16:29:38.003');
INSERT INTO public.orders VALUES (31, 'SO-10028', 2, '2025-01-21 22:23:11.444', 'SHIPPED', 5069.94, 'Sample order 29 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:38.066', '2025-05-21 16:29:38.066');
INSERT INTO public.orders VALUES (32, 'SO-10029', 3, '2025-04-27 22:45:20.308', 'DRAFT', 239.96999999999997, 'Sample order 30 for European Distributors Ltd', 'Shipping to European Distributors Ltd at their registered address', NULL, '2025-05-21 16:29:38.145', '2025-05-21 16:29:38.145');
INSERT INTO public.orders VALUES (33, 'SO-10030', 3, '2025-03-22 08:01:44.102', 'DRAFT', 4499.91, 'Sample order 31 for European Distributors Ltd', 'Shipping to European Distributors Ltd at their registered address', NULL, '2025-05-21 16:29:38.192', '2025-05-21 16:29:38.192');
INSERT INTO public.orders VALUES (34, 'SO-10031', 5, '2025-05-15 11:21:24.615', 'CONFIRMED', 11399.69, 'Sample order 32 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:38.239', '2025-05-21 16:29:38.239');
INSERT INTO public.orders VALUES (35, 'SO-10032', 5, '2025-03-02 04:57:18.132', 'CONFIRMED', 1049.94, 'Sample order 33 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:38.333', '2025-05-21 16:29:38.333');
INSERT INTO public.orders VALUES (36, 'SO-10033', 2, '2025-04-02 18:15:28.827', 'DELIVERED', 4029.66, 'Sample order 34 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:38.397', '2025-05-21 16:29:38.397');
INSERT INTO public.orders VALUES (37, 'SO-10034', 2, '2024-12-30 02:51:24.05', 'CONFIRMED', 319.96, 'Sample order 35 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:38.523', '2025-05-21 16:29:38.523');
INSERT INTO public.orders VALUES (38, 'SO-10035', 4, '2025-02-20 15:40:35.692', 'CONFIRMED', 9349.92, 'Sample order 36 for Tech Solutions GmbH', 'Shipping to Tech Solutions GmbH at their registered address', NULL, '2025-05-21 16:29:38.571', '2025-05-21 16:29:38.571');
INSERT INTO public.orders VALUES (39, 'SO-10036', 1, '2024-12-18 11:36:51.5', 'DELIVERED', 9339.75, 'Sample order 37 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:38.644', '2025-05-21 16:29:38.644');
INSERT INTO public.orders VALUES (40, 'SO-10037', 1, '2024-12-12 07:21:42.349', 'SHIPPED', 5749.83, 'Sample order 38 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:38.756', '2025-05-21 16:29:38.756');
INSERT INTO public.orders VALUES (41, 'SO-10038', 1, '2024-12-17 22:48:02.894', 'CONFIRMED', 3479.86, 'Sample order 39 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:38.853', '2025-05-21 16:29:38.853');
INSERT INTO public.orders VALUES (42, 'SO-10039', 2, '2025-04-26 05:01:08.069', 'CONFIRMED', 5749.8099999999995, 'Sample order 40 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:38.917', '2025-05-21 16:29:38.917');
INSERT INTO public.orders VALUES (43, 'SO-10040', 1, '2025-03-29 04:54:40.334', 'PROCESSING', 3209.79, 'Sample order 41 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:39.012', '2025-05-21 16:29:39.012');
INSERT INTO public.orders VALUES (44, 'SO-10041', 1, '2025-03-09 00:25:18.663', 'DRAFT', 11469.87, 'Sample order 42 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:39.092', '2025-05-21 16:29:39.092');
INSERT INTO public.orders VALUES (45, 'SO-10042', 2, '2025-02-16 07:37:27.292', 'CONFIRMED', 6129.85, 'Sample order 43 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:39.17', '2025-05-21 16:29:39.17');
INSERT INTO public.orders VALUES (46, 'SO-10043', 5, '2025-02-16 07:23:13.799', 'DRAFT', 2239.8500000000004, 'Sample order 44 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:39.289', '2025-05-21 16:29:39.289');
INSERT INTO public.orders VALUES (47, 'SO-10044', 2, '2025-02-12 01:25:13.831', 'DRAFT', 10849.87, 'Sample order 45 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:39.37', '2025-05-21 16:29:39.37');
INSERT INTO public.orders VALUES (48, 'SO-10045', 5, '2025-04-18 12:23:00.681', 'SHIPPED', 869.9300000000001, 'Sample order 46 for Japan Manufacturing Co.', 'Shipping to Japan Manufacturing Co. at their registered address', NULL, '2025-05-21 16:29:39.433', '2025-05-21 16:29:39.433');
INSERT INTO public.orders VALUES (49, 'SO-10046', 4, '2025-03-29 13:28:24.852', 'SHIPPED', 1199.98, 'Sample order 47 for Tech Solutions GmbH', 'Shipping to Tech Solutions GmbH at their registered address', NULL, '2025-05-21 16:29:39.527', '2025-05-21 16:29:39.527');
INSERT INTO public.orders VALUES (50, 'SO-10047', 2, '2024-12-13 18:44:12.34', 'DRAFT', 4799.83, 'Sample order 48 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:39.59', '2025-05-21 16:29:39.59');
INSERT INTO public.orders VALUES (51, 'SO-10048', 1, '2024-11-21 17:19:52.771', 'CONFIRMED', 6689.6900000000005, 'Sample order 49 for Acme Corporation', 'Shipping to Acme Corporation at their registered address', NULL, '2025-05-21 16:29:39.653', '2025-05-21 16:29:39.653');
INSERT INTO public.orders VALUES (52, 'SO-10049', 2, '2025-03-22 10:52:52.984', 'DRAFT', 15159.69, 'Sample order 50 for Global Enterprises', 'Shipping to Global Enterprises at their registered address', NULL, '2025-05-21 16:29:39.765', '2025-05-21 16:29:39.765');


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.invoices VALUES (1, 'INV-10000', 3, '2025-02-14 07:25:12.502', '2025-03-16 07:25:12.502', 7469.740000000001, 'PAID', '2025-03-05 07:25:12.502', 1, '2025-05-21 16:29:36.095', '2025-05-21 16:29:36.095');
INSERT INTO public.invoices VALUES (2, 'INV-10017', 20, '2025-05-01 21:09:29.634', '2025-05-31 21:09:29.634', 11439.71, 'PAID', '2025-05-09 21:09:29.634', 1, '2025-05-21 16:29:37.327', '2025-05-21 16:29:37.327');
INSERT INTO public.invoices VALUES (3, 'INV-10023', 26, '2024-12-29 18:43:15.488', '2025-01-28 18:43:15.488', 2289.85, 'PAID', '2025-01-14 18:43:15.488', 1, '2025-05-21 16:29:37.785', '2025-05-21 16:29:37.785');
INSERT INTO public.invoices VALUES (4, 'INV-10024', 27, '2025-04-02 03:12:19.304', '2025-05-02 03:12:19.304', 5399.91, 'ISSUED', NULL, 1, '2025-05-21 16:29:37.848', '2025-05-21 16:29:37.848');
INSERT INTO public.invoices VALUES (5, 'INV-10028', 31, '2025-01-24 22:23:11.444', '2025-02-23 22:23:11.444', 5069.94, 'ISSUED', NULL, 1, '2025-05-21 16:29:38.129', '2025-05-21 16:29:38.129');
INSERT INTO public.invoices VALUES (6, 'INV-10033', 36, '2025-04-02 18:15:28.827', '2025-05-02 18:15:28.827', 4029.66, 'PAID', '2025-04-25 18:15:28.827', 1, '2025-05-21 16:29:38.506', '2025-05-21 16:29:38.506');
INSERT INTO public.invoices VALUES (7, 'INV-10036', 39, '2024-12-18 11:36:51.5', '2025-01-17 11:36:51.5', 9339.75, 'PAID', '2025-01-07 11:36:51.5', 1, '2025-05-21 16:29:38.739', '2025-05-21 16:29:38.739');
INSERT INTO public.invoices VALUES (8, 'INV-10037', 40, '2024-12-16 07:21:42.349', '2025-01-15 07:21:42.349', 5749.83, 'ISSUED', NULL, 1, '2025-05-21 16:29:38.837', '2025-05-21 16:29:38.837');
INSERT INTO public.invoices VALUES (9, 'INV-10045', 48, '2025-04-19 12:23:00.681', '2025-05-19 12:23:00.681', 869.9300000000001, 'ISSUED', NULL, 1, '2025-05-21 16:29:39.511', '2025-05-21 16:29:39.511');
INSERT INTO public.invoices VALUES (10, 'INV-10046', 49, '2025-03-30 13:28:24.852', '2025-04-29 13:28:24.852', 1199.98, 'ISSUED', NULL, 1, '2025-05-21 16:29:39.574', '2025-05-21 16:29:39.574');


--
-- Data for Name: journal_entries; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.journal_entries VALUES (1, 'JE-2025-001', NULL, 'SA', '2025-06-01', '2025-06-01', '06', 2025, NULL, 1.0000, NULL, 'Monthly depreciation expense', 5000.00, 5000.00, NULL, NULL, NULL, 'Posted', '2025-06-04 01:15:51.540258', NULL);
INSERT INTO public.journal_entries VALUES (2, 'JE-2025-002', NULL, 'SA', '2025-06-02', '2025-06-02', '06', 2025, NULL, 1.0000, NULL, 'Accrued salaries payable', 15000.00, 15000.00, NULL, NULL, NULL, 'Posted', '2025-06-04 01:15:51.540258', NULL);
INSERT INTO public.journal_entries VALUES (3, 'JE-2025-003', NULL, 'SA', '2025-06-03', '2025-06-03', '06', 2025, NULL, 1.0000, NULL, 'Purchase of office supplies', 2500.00, 2500.00, NULL, NULL, NULL, 'Posted', '2025-06-04 01:15:51.540258', NULL);
INSERT INTO public.journal_entries VALUES (4, 'JE-2025-004', NULL, 'SA', '2025-06-04', '2025-06-04', '06', 2025, NULL, 1.0000, NULL, 'Bank loan interest expense', 1200.00, 1200.00, NULL, NULL, NULL, 'Draft', '2025-06-04 01:15:51.540258', NULL);
INSERT INTO public.journal_entries VALUES (5, 'JE-2025-005', NULL, 'SA', '2025-06-05', '2025-06-05', '06', 2025, NULL, 1.0000, NULL, 'Inventory adjustment', 3200.00, 3200.00, NULL, NULL, NULL, 'Posted', '2025-06-04 01:15:51.540258', NULL);


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.leads VALUES (1, 'John', 'Smith', 'Tech Innovations', 'CTO', 'john.smith@techinnovations.com', '(555) 123-4567', 'New', 'Website', 'Technology', 5000000.00, 50, 'www.techinnovations.com', NULL, NULL, NULL, NULL, NULL, 'Interested in ERP solutions for tech startups', NULL, NULL, NULL, NULL, false, NULL, '2025-05-21 23:38:46.934661', '2025-05-21 23:38:46.934661');
INSERT INTO public.leads VALUES (2, 'Emma', 'Johnson', 'Healthcare Solutions', 'Director of Operations', 'emma.johnson@healthcaresolutions.com', '(555) 234-5678', 'New', 'Trade Show', 'Healthcare', 12000000.00, 120, 'www.healthcaresolutions.com', NULL, NULL, NULL, NULL, NULL, 'Looking for inventory management solutions', NULL, NULL, NULL, NULL, false, NULL, '2025-05-21 23:38:46.95743', '2025-05-21 23:38:46.95743');
INSERT INTO public.leads VALUES (3, 'Michael', 'Davis', 'Davis Manufacturing', 'CEO', 'michael.davis@davismanufacturing.com', '(555) 345-6789', 'New', 'Referral', 'Manufacturing', 8500000.00, 75, 'www.davismanufacturing.com', NULL, NULL, NULL, NULL, NULL, 'Needs a complete ERP system', NULL, NULL, NULL, NULL, false, NULL, '2025-05-21 23:38:46.975151', '2025-05-21 23:38:46.975151');
INSERT INTO public.leads VALUES (4, 'Sarah', 'Wilson', 'Wilson Retail Group', 'Procurement Manager', 'sarah.wilson@wilsonretail.com', '(555) 456-7890', 'New', 'Email Campaign', 'Retail', 20000000.00, 200, 'www.wilsonretail.com', NULL, NULL, NULL, NULL, NULL, 'Interested in inventory and POS integration', NULL, NULL, NULL, NULL, false, NULL, '2025-05-21 23:38:46.993483', '2025-05-21 23:38:46.993483');
INSERT INTO public.leads VALUES (5, 'Robert', 'Brown', 'Brown Financial', 'CFO', 'robert.brown@brownfinancial.com', '(555) 567-8901', 'New', 'Webinar', 'Financial Services', 15000000.00, 65, 'www.brownfinancial.com', NULL, NULL, NULL, NULL, NULL, 'Looking for financial management modules', NULL, NULL, NULL, NULL, false, NULL, '2025-05-21 23:38:47.012149', '2025-05-21 23:38:47.012149');
INSERT INTO public.leads VALUES (6, 'Jennifer', 'Lee', 'Lee Education Services', 'Director', 'jennifer.lee@leeeducation.com', '(555) 678-9012', 'Contacted', 'Website', 'Education', 3000000.00, 30, 'www.leeeducation.com', NULL, NULL, NULL, NULL, NULL, 'Initial call completed, requested demo', '2025-05-18 23:38:46.923', '2025-05-28 23:38:46.924', NULL, NULL, false, NULL, '2025-05-21 23:38:47.034029', '2025-05-21 23:38:47.034029');
INSERT INTO public.leads VALUES (7, 'David', 'Miller', 'Miller Tech Solutions', 'COO', 'david.miller@millertech.com', '(555) 789-0123', 'Contacted', 'Social Media', 'Technology', 7500000.00, 45, 'www.millertech.com', NULL, NULL, NULL, NULL, NULL, 'Spoke about inventory needs, follow up with pricing', '2025-05-16 23:38:46.924', '2025-05-26 23:38:46.924', NULL, NULL, false, NULL, '2025-05-21 23:38:47.05167', '2025-05-21 23:38:47.05167');
INSERT INTO public.leads VALUES (8, 'Patricia', 'Garcia', 'Garcia Manufacturing', 'Operations Manager', 'patricia.garcia@garciamanufacturing.com', '(555) 890-1234', 'Contacted', 'Trade Show', 'Manufacturing', 10000000.00, 90, 'www.garciamanufacturing.com', NULL, NULL, NULL, NULL, NULL, 'Initial discussion about production modules', '2025-05-19 23:38:46.924', '2025-05-31 23:38:46.924', NULL, NULL, false, NULL, '2025-05-21 23:38:47.06892', '2025-05-21 23:38:47.06892');
INSERT INTO public.leads VALUES (9, 'James', 'Taylor', 'Taylor Consulting', 'Managing Partner', 'james.taylor@taylorconsulting.com', '(555) 901-2345', 'Contacted', 'Referral', 'Professional Services', 2500000.00, 15, 'www.taylorconsulting.com', NULL, NULL, NULL, NULL, NULL, 'Had intro call, wants demo next week', '2025-05-20 23:38:46.924', '2025-05-27 23:38:46.924', NULL, NULL, false, NULL, '2025-05-21 23:38:47.086203', '2025-05-21 23:38:47.086203');
INSERT INTO public.leads VALUES (10, 'Elizabeth', 'Moore', 'Moore Health Systems', 'CIO', 'elizabeth.moore@moorehealth.com', '(555) 012-3456', 'Qualified', 'Webinar', 'Healthcare', 18000000.00, 150, 'www.moorehealth.com', NULL, NULL, NULL, NULL, NULL, 'Completed needs assessment, high potential', '2025-05-13 23:38:46.924', '2025-05-24 23:38:46.924', NULL, 85, false, NULL, '2025-05-21 23:38:47.104021', '2025-05-21 23:38:47.104021');
INSERT INTO public.leads VALUES (11, 'William', 'White', 'White Industries', 'VP of Operations', 'william.white@whiteindustries.com', '(555) 123-4567', 'Qualified', 'Partner', 'Manufacturing', 25000000.00, 200, 'www.whiteindustries.com', NULL, NULL, NULL, NULL, NULL, 'Ready for detailed proposal, budget approved', '2025-05-17 23:38:46.924', '2025-05-23 23:38:46.924', NULL, 90, false, NULL, '2025-05-21 23:38:47.121482', '2025-05-21 23:38:47.121482');
INSERT INTO public.leads VALUES (12, 'Barbara', 'Jones', 'Jones Retail', 'CEO', 'barbara.jones@jonesretail.com', '(555) 234-5678', 'Qualified', 'Website', 'Retail', 12000000.00, 120, 'www.jonesretail.com', NULL, NULL, NULL, NULL, NULL, 'Completed requirements gathering, good fit', '2025-05-15 23:38:46.924', '2025-05-25 23:38:46.924', NULL, 80, false, NULL, '2025-05-21 23:38:47.139809', '2025-05-21 23:38:47.139809');
INSERT INTO public.leads VALUES (13, 'Richard', 'Clark', 'Clark Financial', 'Director of IT', 'richard.clark@clarkfinancial.com', '(555) 345-6789', 'Qualified', 'Email Campaign', 'Financial Services', 30000000.00, 80, 'www.clarkfinancial.com', NULL, NULL, NULL, NULL, NULL, 'Has specific requirements, ready for formal quote', '2025-05-11 23:38:46.924', '2025-05-22 23:38:46.924', NULL, 95, false, NULL, '2025-05-21 23:38:47.158429', '2025-05-21 23:38:47.158429');
INSERT INTO public.leads VALUES (14, 'Susan', 'Anderson', 'Anderson Academy', 'President', 'susan.anderson@andersonacademy.edu', '(555) 456-7890', 'Nurturing', 'Trade Show', 'Education', 5000000.00, 75, 'www.andersonacademy.edu', NULL, NULL, NULL, NULL, NULL, 'Interested but no budget until next quarter', '2025-05-06 23:38:46.924', '2025-06-20 23:38:46.924', NULL, 60, false, NULL, '2025-05-21 23:38:47.178116', '2025-05-21 23:38:47.178116');
INSERT INTO public.leads VALUES (15, 'Thomas', 'Martinez', 'Martinez Technologies', 'CTO', 'thomas.martinez@martineztech.com', '(555) 567-8901', 'Nurturing', 'Webinar', 'Technology', 8000000.00, 40, 'www.martineztech.com', NULL, NULL, NULL, NULL, NULL, 'Needs more education about solution benefits', '2025-05-01 23:38:46.924', '2025-06-05 23:38:46.924', NULL, 45, false, NULL, '2025-05-21 23:38:47.195594', '2025-05-21 23:38:47.195594');
INSERT INTO public.leads VALUES (16, 'Mary', 'Robinson', 'Robinson Healthcare', 'Procurement Director', 'mary.robinson@robinsonhealth.com', '(555) 678-9012', 'Nurturing', 'Social Media', 'Healthcare', 15000000.00, 130, 'www.robinsonhealth.com', NULL, NULL, NULL, NULL, NULL, 'Still researching options, send case studies', '2025-05-09 23:38:46.924', '2025-06-10 23:38:46.924', NULL, 55, false, NULL, '2025-05-21 23:38:47.21573', '2025-05-21 23:38:47.21573');
INSERT INTO public.leads VALUES (17, 'Charles', 'Lewis', 'Lewis Manufacturing', 'Operations Director', 'charles.lewis@lewismanufacturing.com', '(555) 789-0123', 'Nurturing', 'Email Campaign', 'Manufacturing', 20000000.00, 180, 'www.lewismanufacturing.com', NULL, NULL, NULL, NULL, NULL, 'Implementing another system now, revisit later', '2025-04-26 23:38:46.924', '2025-07-20 23:38:46.924', NULL, 40, false, NULL, '2025-05-21 23:38:47.233772', '2025-05-21 23:38:47.233772');
INSERT INTO public.leads VALUES (18, 'Lisa', 'Walker', 'Walker Group', 'CFO', 'lisa.walker@walkergroup.com', '(555) 890-1234', 'Disqualified', 'Website', 'Professional Services', 1000000.00, 8, 'www.walkergroup.com', NULL, NULL, NULL, NULL, NULL, 'Too small for our solution, not a good fit', '2025-04-21 23:38:46.924', NULL, NULL, 10, false, NULL, '2025-05-21 23:38:47.251179', '2025-05-21 23:38:47.251179');
INSERT INTO public.leads VALUES (19, 'Daniel', 'Hall', 'Hall Tech', 'CEO', 'daniel.hall@halltech.com', '(555) 901-2345', 'Disqualified', 'Cold Call', 'Technology', 500000.00, 5, 'www.halltech.com', NULL, NULL, NULL, NULL, NULL, 'No budget, using free alternatives', '2025-04-06 23:38:46.924', NULL, NULL, 5, false, NULL, '2025-05-21 23:38:47.268622', '2025-05-21 23:38:47.268622');
INSERT INTO public.leads VALUES (20, 'Nancy', 'Allen', 'Allen Consulting', 'Principal', 'nancy.allen@allenconsulting.com', '(555) 012-3456', 'Disqualified', 'Partner', 'Professional Services', 750000.00, 4, 'www.allenconsulting.com', NULL, NULL, NULL, NULL, NULL, 'Outside our target market segment', '2025-03-22 23:38:46.924', NULL, NULL, 15, false, NULL, '2025-05-21 23:38:47.286383', '2025-05-21 23:38:47.286383');
INSERT INTO public.leads VALUES (21, 'Paul', 'Young', 'Young Enterprises', 'Owner', 'paul.young@youngenterprises.com', '(555) 123-4567', 'Disqualified', 'Trade Show', 'Retail', 300000.00, 3, 'www.youngenterprises.com', NULL, NULL, NULL, NULL, NULL, 'Selected competitor solution', '2025-05-06 23:38:46.924', NULL, NULL, 20, false, NULL, '2025-05-21 23:38:47.303792', '2025-05-21 23:38:47.303792');
INSERT INTO public.leads VALUES (22, 'Sam', 'Josh', 'samJ', NULL, 'samj@gmail.com', '', 'Contacted', 'Website', 'Technology', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2025-05-22 19:00:33.604778', '2025-05-22 19:00:33.604778');
INSERT INTO public.leads VALUES (23, 'aF', '', 'TES', NULL, 'sapbdc1@mail.com', '22', 'Qualified', 'Website', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2025-05-23 01:53:09.735372', '2025-05-23 01:53:09.735372');
INSERT INTO public.leads VALUES (24, 'Rita', '', 'May23', NULL, 'Rita12@mail.com', '', 'New', 'Website', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, NULL, '2025-05-23 04:51:05.225758', '2025-05-23 04:51:05.225758');


--
-- Data for Name: material_categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.material_categories VALUES (1, 'RM', 'Raw Materials', 'Base materials used in production', NULL, '2025-05-21 15:12:13.362374', '2025-05-21 15:12:13.362374');
INSERT INTO public.material_categories VALUES (2, 'FG', 'Finished Goods', 'Products ready for sale', NULL, '2025-05-21 15:12:13.362374', '2025-05-21 15:12:13.362374');
INSERT INTO public.material_categories VALUES (3, 'SFG', 'Semi-finished', 'Intermediate products', NULL, '2025-05-21 15:12:13.362374', '2025-05-21 15:12:13.362374');
INSERT INTO public.material_categories VALUES (4, 'SPRT', 'Spare Parts', 'Components for maintenance and repair', NULL, '2025-05-21 15:12:13.362374', '2025-05-21 15:12:13.362374');
INSERT INTO public.material_categories VALUES (5, 'PKG', 'Packaging', 'Materials used for packaging products', NULL, '2025-05-21 15:12:13.362374', '2025-05-21 15:12:13.362374');
INSERT INTO public.material_categories VALUES (6, 'CONS', 'Consumables', 'Materials consumed during production', NULL, '2025-05-21 15:12:13.362374', '2025-05-21 15:12:13.362374');
INSERT INTO public.material_categories VALUES (7, 'RM-MET', 'Metals', 'Metal raw materials', 1, '2025-05-21 15:12:24.470947', '2025-05-21 15:12:24.470947');
INSERT INTO public.material_categories VALUES (8, 'RM-PLST', 'Plastics', 'Plastic raw materials', 1, '2025-05-21 15:12:24.470947', '2025-05-21 15:12:24.470947');
INSERT INTO public.material_categories VALUES (9, 'FG-ELEC', 'Electronics', 'Electronic finished products', 2, '2025-05-21 15:12:24.470947', '2025-05-21 15:12:24.470947');
INSERT INTO public.material_categories VALUES (10, 'FG-TOOL', 'Tools', 'Hand and power tools', 2, '2025-05-21 15:12:24.470947', '2025-05-21 15:12:24.470947');
INSERT INTO public.material_categories VALUES (11, 'PKG-BOX', 'Boxes', 'Cardboard and corrugated boxes', 5, '2025-05-21 15:12:24.470947', '2025-05-21 15:12:24.470947');


--
-- Data for Name: opportunities; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.opportunities VALUES (1, 'Lee Education Services - Education Solution', 6, NULL, 'Open', 'Prospecting', 98612.00, 9861.20, 10, '2025-08-23 23:38:47.376', 'Follow up with Jennifer', 'Upgrade', 'Lead Conversion', NULL, 'Opportunity for Lee Education Services in the Education industry', NULL, false, false, NULL, '2025-05-21 23:38:47.38633', '2025-05-21 23:38:47.38633');
INSERT INTO public.opportunities VALUES (2, 'Miller Tech Solutions - Technology Solution', 7, NULL, 'Open', 'Qualification', 67801.00, 13560.20, 20, '2025-09-01 23:38:47.376', 'Follow up with David', 'Existing Business', 'Lead Conversion', NULL, 'Opportunity for Miller Tech Solutions in the Technology industry', NULL, false, false, NULL, '2025-05-21 23:38:47.405549', '2025-05-21 23:38:47.405549');
INSERT INTO public.opportunities VALUES (3, 'Garcia Manufacturing - Manufacturing Solution', 8, NULL, 'Open', 'Needs Analysis', 38398.00, 11519.40, 30, '2025-10-23 23:38:47.376', 'Follow up with Patricia', 'New Business', 'Lead Conversion', NULL, 'Opportunity for Garcia Manufacturing in the Manufacturing industry', NULL, false, false, NULL, '2025-05-21 23:38:47.423186', '2025-05-21 23:38:47.423186');
INSERT INTO public.opportunities VALUES (4, 'Taylor Consulting - Professional Services Solution', 9, NULL, 'Open', 'Value Proposition', 30785.00, 12314.00, 40, '2025-10-05 23:38:47.376', 'Follow up with James', 'Existing Business', 'Lead Conversion', NULL, 'Opportunity for Taylor Consulting in the Professional Services industry', NULL, false, false, NULL, '2025-05-21 23:38:47.440964', '2025-05-21 23:38:47.440964');
INSERT INTO public.opportunities VALUES (5, 'Moore Health Systems - Healthcare Solution', 10, NULL, 'Open', 'Identify Decision Makers', 59384.00, 29692.00, 50, '2025-08-24 23:38:47.376', 'Follow up with Elizabeth', 'New Business', 'Lead Conversion', NULL, 'Opportunity for Moore Health Systems in the Healthcare industry', NULL, false, false, NULL, '2025-05-21 23:38:47.459055', '2025-05-21 23:38:47.459055');
INSERT INTO public.opportunities VALUES (6, 'White Industries - Manufacturing Solution', 11, NULL, 'Open', 'Proposal/Price Quote', 34939.00, 20963.40, 60, '2025-09-06 23:38:47.376', 'Follow up with William', 'Upgrade', 'Lead Conversion', NULL, 'Opportunity for White Industries in the Manufacturing industry', NULL, false, false, NULL, '2025-05-21 23:38:47.476515', '2025-05-21 23:38:47.476515');
INSERT INTO public.opportunities VALUES (7, 'Jones Retail - Retail Solution', 12, NULL, 'Open', 'Negotiation/Review', 63504.00, 47628.00, 75, '2025-07-04 23:38:47.376', 'Follow up with Barbara', 'Upgrade', 'Lead Conversion', NULL, 'Opportunity for Jones Retail in the Retail industry', NULL, false, false, NULL, '2025-05-21 23:38:47.49444', '2025-05-21 23:38:47.49444');
INSERT INTO public.opportunities VALUES (8, 'Clark Financial - Financial Services Solution', 13, NULL, 'Closed Won', 'Closed Won', 89097.00, 89097.00, 100, '2025-05-21 23:38:47.376', 'None', 'Existing Business', 'Lead Conversion', NULL, 'Opportunity for Clark Financial in the Financial Services industry', NULL, true, true, NULL, '2025-05-21 23:38:47.512112', '2025-05-21 23:38:47.512112');
INSERT INTO public.opportunities VALUES (9, 'Lee Education Services - Education Solution', 6, NULL, 'Closed Lost', 'Closed Lost', 90911.00, 0.00, 0, '2025-05-11 23:38:47.376', 'None', 'New Business', 'Lead Conversion', NULL, 'Opportunity for Lee Education Services in the Education industry', NULL, true, false, NULL, '2025-05-21 23:38:47.532369', '2025-05-21 23:38:47.532369');
INSERT INTO public.opportunities VALUES (10, 'Jones Retail - Additional Retail Project', 12, NULL, 'Open', 'Qualification', 28807.00, 5761.40, 20, '2025-06-02 23:38:47.376', 'Schedule meeting with Barbara', 'Upgrade', 'Lead Conversion', NULL, 'Additional opportunity for Jones Retail in the Retail industry', NULL, false, false, NULL, '2025-05-21 23:38:47.550037', '2025-05-21 23:38:47.550037');
INSERT INTO public.opportunities VALUES (11, 'Clark Financial - Additional Financial Services Project', 13, NULL, 'Open', 'Needs Analysis', 43756.00, 13126.80, 30, '2025-05-31 23:38:47.376', 'Schedule meeting with Richard', 'Upgrade', 'Lead Conversion', NULL, 'Additional opportunity for Clark Financial in the Financial Services industry', NULL, false, false, NULL, '2025-05-21 23:38:47.568149', '2025-05-21 23:38:47.568149');
INSERT INTO public.opportunities VALUES (12, 'Jones Retail - Additional Retail Project', 12, NULL, 'Open', 'Identify Decision Makers', 75321.00, 37660.50, 50, '2025-08-06 23:38:47.376', 'Schedule meeting with Barbara', 'New Business', 'Lead Conversion', NULL, 'Additional opportunity for Jones Retail in the Retail industry', NULL, false, false, NULL, '2025-05-21 23:38:47.585741', '2025-05-21 23:38:47.585741');
INSERT INTO public.opportunities VALUES (13, 'Taylor Consulting - Additional Professional Services Project', 9, NULL, 'Open', 'Proposal/Price Quote', 26130.00, 15678.00, 60, '2025-06-15 23:38:47.376', 'Schedule meeting with James', 'Upgrade', 'Lead Conversion', NULL, 'Additional opportunity for Taylor Consulting in the Professional Services industry', NULL, false, false, NULL, '2025-05-21 23:38:47.603145', '2025-05-21 23:38:47.603145');
INSERT INTO public.opportunities VALUES (14, 'Lee Education Services - Additional Education Project', 6, NULL, 'Open', 'Negotiation/Review', 15916.00, 11937.00, 75, '2025-07-09 23:38:47.376', 'Schedule meeting with Jennifer', 'Existing Business', 'Lead Conversion', NULL, 'Additional opportunity for Lee Education Services in the Education industry', NULL, false, false, NULL, '2025-05-21 23:38:47.620392', '2025-05-21 23:38:47.620392');
INSERT INTO public.opportunities VALUES (15, 'Jones Retail - Additional Retail Project', 12, NULL, 'Open', 'Prospecting', 18557.00, 1855.70, 10, '2025-07-02 23:38:47.376', 'Schedule meeting with Barbara', 'New Business', 'Lead Conversion', NULL, 'Additional opportunity for Jones Retail in the Retail industry', NULL, false, false, NULL, '2025-05-21 23:38:47.637868', '2025-05-21 23:38:47.637868');
INSERT INTO public.opportunities VALUES (16, 'Miller Tech Solutions - Additional Technology Project', 7, NULL, 'Open', 'Value Proposition', 14051.00, 5620.40, 40, '2025-06-16 23:38:47.376', 'Schedule meeting with David', 'Existing Business', 'Lead Conversion', NULL, 'Additional opportunity for Miller Tech Solutions in the Technology industry', NULL, false, false, NULL, '2025-05-21 23:38:47.655522', '2025-05-21 23:38:47.655522');
INSERT INTO public.opportunities VALUES (17, 'NewOpportunity', 2, NULL, 'Open', 'Needs Analysis', 200.00, 0.00, 10, '2025-05-23 00:00:00', '', 'New Business', 'Manual Entry', NULL, '', NULL, false, false, NULL, '2025-05-23 01:33:26.916831', '2025-05-23 01:33:26.916831');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.products VALUES (1, 'Premium Laptop', 'TECH-001', 'High-quality premium laptop for professional use', 1299.99, 950, 25, 5, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (2, 'Office Chair', 'FURN-001', 'High-quality office chair for professional use', 249.99, 150, 50, 10, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (3, 'Standing Desk', 'FURN-002', 'High-quality standing desk for professional use', 599.99, 350, 15, 3, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (4, 'Wireless Earbuds', 'TECH-002', 'High-quality wireless earbuds for professional use', 129.99, 65, 100, 20, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (5, 'Smart Watch', 'TECH-003', 'High-quality smart watch for professional use', 349.99, 200, 30, 8, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (6, 'External Hard Drive', 'TECH-004', 'High-quality external hard drive for professional use', 89.99, 45, 40, 10, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (7, 'Wireless Mouse', 'TECH-005', 'High-quality wireless mouse for professional use', 49.99, 25, 75, 15, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (8, 'Bluetooth Speaker', 'TECH-006', 'High-quality bluetooth speaker for professional use', 79.99, 40, 60, 12, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (9, 'Monitor', 'TECH-007', 'High-quality monitor for professional use', 299.99, 180, 35, 7, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (10, 'Printer', 'TECH-008', 'High-quality printer for professional use', 179.99, 120, 20, 5, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (11, 'Smartphone', 'TECH-009', 'High-quality smartphone for professional use', 899.99, 650, 40, 8, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (12, 'Tablet', 'TECH-010', 'High-quality tablet for professional use', 499.99, 350, 30, 6, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (13, 'Desktop PC', 'TECH-011', 'High-quality desktop pc for professional use', 999.99, 750, 15, 3, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (14, 'Keyboard', 'TECH-012', 'High-quality keyboard for professional use', 69.99, 35, 50, 10, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (15, 'USB-C Hub', 'TECH-013', 'High-quality usb-c hub for professional use', 39.99, 18, 80, 20, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (16, 'Webcam', 'TECH-014', 'High-quality webcam for professional use', 59.99, 30, 45, 10, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (17, 'Microphone', 'TECH-015', 'High-quality microphone for professional use', 129.99, 65, 25, 5, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (18, 'Router', 'TECH-016', 'High-quality router for professional use', 149.99, 80, 20, 5, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (19, 'Power Bank', 'TECH-017', 'High-quality power bank for professional use', 49.99, 25, 60, 15, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');
INSERT INTO public.products VALUES (20, 'VR Headset', 'TECH-018', 'High-quality vr headset for professional use', 399.99, 250, 10, 2, 1, NULL, '2025-05-21 16:28:39.279', '2025-05-21 16:28:39.279');


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.order_items VALUES (2, 3, 15, 7, 39.99, 279.93, '2025-05-21 16:29:36.011', '2025-05-21 16:29:36.011');
INSERT INTO public.order_items VALUES (3, 3, 17, 3, 129.99, 389.97, '2025-05-21 16:29:36.028', '2025-05-21 16:29:36.028');
INSERT INTO public.order_items VALUES (4, 3, 8, 10, 79.99, 799.9, '2025-05-21 16:29:36.045', '2025-05-21 16:29:36.045');
INSERT INTO public.order_items VALUES (5, 3, 13, 6, 999.99, 5999.9400000000005, '2025-05-21 16:29:36.061', '2025-05-21 16:29:36.061');
INSERT INTO public.order_items VALUES (6, 4, 5, 7, 349.99, 2449.9300000000003, '2025-05-21 16:29:36.146', '2025-05-21 16:29:36.146');
INSERT INTO public.order_items VALUES (7, 5, 13, 10, 999.99, 9999.9, '2025-05-21 16:29:36.193', '2025-05-21 16:29:36.193');
INSERT INTO public.order_items VALUES (8, 6, 7, 4, 49.99, 199.96, '2025-05-21 16:29:36.241', '2025-05-21 16:29:36.241');
INSERT INTO public.order_items VALUES (9, 6, 17, 7, 129.99, 909.9300000000001, '2025-05-21 16:29:36.257', '2025-05-21 16:29:36.257');
INSERT INTO public.order_items VALUES (10, 6, 18, 8, 149.99, 1199.92, '2025-05-21 16:29:36.272', '2025-05-21 16:29:36.272');
INSERT INTO public.order_items VALUES (11, 7, 5, 10, 349.99, 3499.9, '2025-05-21 16:29:36.32', '2025-05-21 16:29:36.32');
INSERT INTO public.order_items VALUES (12, 8, 16, 10, 59.99, 599.9, '2025-05-21 16:29:36.367', '2025-05-21 16:29:36.367');
INSERT INTO public.order_items VALUES (13, 8, 2, 7, 249.99, 1749.93, '2025-05-21 16:29:36.383', '2025-05-21 16:29:36.383');
INSERT INTO public.order_items VALUES (14, 8, 18, 2, 149.99, 299.98, '2025-05-21 16:29:36.399', '2025-05-21 16:29:36.399');
INSERT INTO public.order_items VALUES (15, 9, 13, 1, 999.99, 999.99, '2025-05-21 16:29:36.447', '2025-05-21 16:29:36.447');
INSERT INTO public.order_items VALUES (16, 9, 10, 6, 179.99, 1079.94, '2025-05-21 16:29:36.462', '2025-05-21 16:29:36.462');
INSERT INTO public.order_items VALUES (17, 10, 4, 3, 129.99, 389.97, '2025-05-21 16:29:36.509', '2025-05-21 16:29:36.509');
INSERT INTO public.order_items VALUES (18, 11, 14, 2, 69.99, 139.98, '2025-05-21 16:29:36.559', '2025-05-21 16:29:36.559');
INSERT INTO public.order_items VALUES (19, 11, 18, 7, 149.99, 1049.93, '2025-05-21 16:29:36.575', '2025-05-21 16:29:36.575');
INSERT INTO public.order_items VALUES (20, 11, 5, 10, 349.99, 3499.9, '2025-05-21 16:29:36.59', '2025-05-21 16:29:36.59');
INSERT INTO public.order_items VALUES (21, 12, 19, 10, 49.99, 499.90000000000003, '2025-05-21 16:29:36.638', '2025-05-21 16:29:36.638');
INSERT INTO public.order_items VALUES (22, 12, 8, 9, 79.99, 719.91, '2025-05-21 16:29:36.657', '2025-05-21 16:29:36.657');
INSERT INTO public.order_items VALUES (23, 12, 20, 1, 399.99, 399.99, '2025-05-21 16:29:36.673', '2025-05-21 16:29:36.673');
INSERT INTO public.order_items VALUES (24, 12, 5, 10, 349.99, 3499.9, '2025-05-21 16:29:36.689', '2025-05-21 16:29:36.689');
INSERT INTO public.order_items VALUES (25, 13, 4, 6, 129.99, 779.94, '2025-05-21 16:29:36.742', '2025-05-21 16:29:36.742');
INSERT INTO public.order_items VALUES (26, 14, 8, 2, 79.99, 159.98, '2025-05-21 16:29:36.79', '2025-05-21 16:29:36.79');
INSERT INTO public.order_items VALUES (27, 14, 5, 9, 349.99, 3149.91, '2025-05-21 16:29:36.806', '2025-05-21 16:29:36.806');
INSERT INTO public.order_items VALUES (28, 14, 16, 6, 59.99, 359.94, '2025-05-21 16:29:36.822', '2025-05-21 16:29:36.822');
INSERT INTO public.order_items VALUES (29, 15, 13, 2, 999.99, 1999.98, '2025-05-21 16:29:36.87', '2025-05-21 16:29:36.87');
INSERT INTO public.order_items VALUES (30, 15, 4, 5, 129.99, 649.95, '2025-05-21 16:29:36.885', '2025-05-21 16:29:36.885');
INSERT INTO public.order_items VALUES (31, 16, 1, 1, 1299.99, 1299.99, '2025-05-21 16:29:36.932', '2025-05-21 16:29:36.932');
INSERT INTO public.order_items VALUES (32, 16, 20, 10, 399.99, 3999.9, '2025-05-21 16:29:36.948', '2025-05-21 16:29:36.948');
INSERT INTO public.order_items VALUES (33, 17, 17, 5, 129.99, 649.95, '2025-05-21 16:29:36.995', '2025-05-21 16:29:36.995');
INSERT INTO public.order_items VALUES (34, 17, 19, 4, 49.99, 199.96, '2025-05-21 16:29:37.01', '2025-05-21 16:29:37.01');
INSERT INTO public.order_items VALUES (35, 18, 1, 3, 1299.99, 3899.9700000000003, '2025-05-21 16:29:37.058', '2025-05-21 16:29:37.058');
INSERT INTO public.order_items VALUES (36, 18, 19, 3, 49.99, 149.97, '2025-05-21 16:29:37.074', '2025-05-21 16:29:37.074');
INSERT INTO public.order_items VALUES (37, 18, 2, 1, 249.99, 249.99, '2025-05-21 16:29:37.09', '2025-05-21 16:29:37.09');
INSERT INTO public.order_items VALUES (38, 19, 9, 3, 299.99, 899.97, '2025-05-21 16:29:37.137', '2025-05-21 16:29:37.137');
INSERT INTO public.order_items VALUES (39, 19, 16, 6, 59.99, 359.94, '2025-05-21 16:29:37.153', '2025-05-21 16:29:37.153');
INSERT INTO public.order_items VALUES (40, 19, 14, 4, 69.99, 279.96, '2025-05-21 16:29:37.169', '2025-05-21 16:29:37.169');
INSERT INTO public.order_items VALUES (41, 19, 10, 9, 179.99, 1619.91, '2025-05-21 16:29:37.185', '2025-05-21 16:29:37.185');
INSERT INTO public.order_items VALUES (42, 20, 9, 5, 299.99, 1499.95, '2025-05-21 16:29:37.233', '2025-05-21 16:29:37.233');
INSERT INTO public.order_items VALUES (43, 20, 12, 10, 499.99, 4999.9, '2025-05-21 16:29:37.249', '2025-05-21 16:29:37.249');
INSERT INTO public.order_items VALUES (44, 20, 1, 1, 1299.99, 1299.99, '2025-05-21 16:29:37.265', '2025-05-21 16:29:37.265');
INSERT INTO public.order_items VALUES (45, 20, 8, 8, 79.99, 639.92, '2025-05-21 16:29:37.28', '2025-05-21 16:29:37.28');
INSERT INTO public.order_items VALUES (46, 20, 3, 5, 599.99, 2999.95, '2025-05-21 16:29:37.296', '2025-05-21 16:29:37.296');
INSERT INTO public.order_items VALUES (47, 21, 6, 8, 89.99, 719.92, '2025-05-21 16:29:37.367', '2025-05-21 16:29:37.367');
INSERT INTO public.order_items VALUES (48, 21, 2, 9, 249.99, 2249.91, '2025-05-21 16:29:37.383', '2025-05-21 16:29:37.383');
INSERT INTO public.order_items VALUES (49, 22, 3, 3, 599.99, 1799.97, '2025-05-21 16:29:37.437', '2025-05-21 16:29:37.437');
INSERT INTO public.order_items VALUES (50, 22, 5, 4, 349.99, 1399.96, '2025-05-21 16:29:37.453', '2025-05-21 16:29:37.453');
INSERT INTO public.order_items VALUES (51, 23, 3, 9, 599.99, 5399.91, '2025-05-21 16:29:37.499', '2025-05-21 16:29:37.499');
INSERT INTO public.order_items VALUES (52, 23, 13, 9, 999.99, 8999.91, '2025-05-21 16:29:37.515', '2025-05-21 16:29:37.515');
INSERT INTO public.order_items VALUES (53, 23, 12, 10, 499.99, 4999.9, '2025-05-21 16:29:37.531', '2025-05-21 16:29:37.531');
INSERT INTO public.order_items VALUES (54, 24, 4, 8, 129.99, 1039.92, '2025-05-21 16:29:37.578', '2025-05-21 16:29:37.578');
INSERT INTO public.order_items VALUES (55, 25, 15, 8, 39.99, 319.92, '2025-05-21 16:29:37.625', '2025-05-21 16:29:37.625');
INSERT INTO public.order_items VALUES (56, 25, 5, 6, 349.99, 2099.94, '2025-05-21 16:29:37.641', '2025-05-21 16:29:37.641');
INSERT INTO public.order_items VALUES (57, 25, 4, 4, 129.99, 519.96, '2025-05-21 16:29:37.657', '2025-05-21 16:29:37.657');
INSERT INTO public.order_items VALUES (58, 26, 20, 2, 399.99, 799.98, '2025-05-21 16:29:37.705', '2025-05-21 16:29:37.705');
INSERT INTO public.order_items VALUES (59, 26, 4, 5, 129.99, 649.95, '2025-05-21 16:29:37.721', '2025-05-21 16:29:37.721');
INSERT INTO public.order_items VALUES (60, 26, 9, 2, 299.99, 599.98, '2025-05-21 16:29:37.737', '2025-05-21 16:29:37.737');
INSERT INTO public.order_items VALUES (61, 26, 15, 6, 39.99, 239.94, '2025-05-21 16:29:37.752', '2025-05-21 16:29:37.752');
INSERT INTO public.order_items VALUES (62, 27, 3, 9, 599.99, 5399.91, '2025-05-21 16:29:37.816', '2025-05-21 16:29:37.816');
INSERT INTO public.order_items VALUES (63, 28, 5, 1, 349.99, 349.99, '2025-05-21 16:29:37.879', '2025-05-21 16:29:37.879');
INSERT INTO public.order_items VALUES (64, 28, 9, 5, 299.99, 1499.95, '2025-05-21 16:29:37.894', '2025-05-21 16:29:37.894');
INSERT INTO public.order_items VALUES (65, 28, 15, 1, 39.99, 39.99, '2025-05-21 16:29:37.91', '2025-05-21 16:29:37.91');
INSERT INTO public.order_items VALUES (66, 29, 15, 1, 39.99, 39.99, '2025-05-21 16:29:37.957', '2025-05-21 16:29:37.957');
INSERT INTO public.order_items VALUES (67, 29, 12, 10, 499.99, 4999.9, '2025-05-21 16:29:37.972', '2025-05-21 16:29:37.972');
INSERT INTO public.order_items VALUES (68, 30, 12, 4, 499.99, 1999.96, '2025-05-21 16:29:38.019', '2025-05-21 16:29:38.019');
INSERT INTO public.order_items VALUES (69, 30, 5, 4, 349.99, 1399.96, '2025-05-21 16:29:38.034', '2025-05-21 16:29:38.034');
INSERT INTO public.order_items VALUES (70, 31, 13, 5, 999.99, 4999.95, '2025-05-21 16:29:38.082', '2025-05-21 16:29:38.082');
INSERT INTO public.order_items VALUES (71, 31, 14, 1, 69.99, 69.99, '2025-05-21 16:29:38.097', '2025-05-21 16:29:38.097');
INSERT INTO public.order_items VALUES (72, 32, 8, 3, 79.99, 239.96999999999997, '2025-05-21 16:29:38.16', '2025-05-21 16:29:38.16');
INSERT INTO public.order_items VALUES (73, 33, 12, 9, 499.99, 4499.91, '2025-05-21 16:29:38.208', '2025-05-21 16:29:38.208');
INSERT INTO public.order_items VALUES (74, 34, 18, 8, 149.99, 1199.92, '2025-05-21 16:29:38.255', '2025-05-21 16:29:38.255');
INSERT INTO public.order_items VALUES (75, 34, 13, 8, 999.99, 7999.92, '2025-05-21 16:29:38.271', '2025-05-21 16:29:38.271');
INSERT INTO public.order_items VALUES (76, 34, 14, 10, 69.99, 699.9, '2025-05-21 16:29:38.286', '2025-05-21 16:29:38.286');
INSERT INTO public.order_items VALUES (77, 34, 9, 5, 299.99, 1499.95, '2025-05-21 16:29:38.302', '2025-05-21 16:29:38.302');
INSERT INTO public.order_items VALUES (78, 35, 19, 3, 49.99, 149.97, '2025-05-21 16:29:38.349', '2025-05-21 16:29:38.349');
INSERT INTO public.order_items VALUES (79, 35, 9, 3, 299.99, 899.97, '2025-05-21 16:29:38.365', '2025-05-21 16:29:38.365');
INSERT INTO public.order_items VALUES (80, 36, 7, 7, 49.99, 349.93, '2025-05-21 16:29:38.412', '2025-05-21 16:29:38.412');
INSERT INTO public.order_items VALUES (81, 36, 8, 10, 79.99, 799.9, '2025-05-21 16:29:38.428', '2025-05-21 16:29:38.428');
INSERT INTO public.order_items VALUES (82, 36, 5, 1, 349.99, 349.99, '2025-05-21 16:29:38.443', '2025-05-21 16:29:38.443');
INSERT INTO public.order_items VALUES (83, 36, 17, 7, 129.99, 909.9300000000001, '2025-05-21 16:29:38.459', '2025-05-21 16:29:38.459');
INSERT INTO public.order_items VALUES (84, 36, 10, 9, 179.99, 1619.91, '2025-05-21 16:29:38.475', '2025-05-21 16:29:38.475');
INSERT INTO public.order_items VALUES (85, 37, 8, 4, 79.99, 319.96, '2025-05-21 16:29:38.539', '2025-05-21 16:29:38.539');
INSERT INTO public.order_items VALUES (86, 38, 2, 1, 249.99, 249.99, '2025-05-21 16:29:38.586', '2025-05-21 16:29:38.586');
INSERT INTO public.order_items VALUES (87, 38, 1, 7, 1299.99, 9099.93, '2025-05-21 16:29:38.611', '2025-05-21 16:29:38.611');
INSERT INTO public.order_items VALUES (88, 39, 9, 1, 299.99, 299.99, '2025-05-21 16:29:38.659', '2025-05-21 16:29:38.659');
INSERT INTO public.order_items VALUES (89, 39, 5, 8, 349.99, 2799.92, '2025-05-21 16:29:38.676', '2025-05-21 16:29:38.676');
INSERT INTO public.order_items VALUES (90, 39, 10, 8, 179.99, 1439.92, '2025-05-21 16:29:38.692', '2025-05-21 16:29:38.692');
INSERT INTO public.order_items VALUES (91, 39, 3, 8, 599.99, 4799.92, '2025-05-21 16:29:38.708', '2025-05-21 16:29:38.708');
INSERT INTO public.order_items VALUES (92, 40, 7, 8, 49.99, 399.92, '2025-05-21 16:29:38.771', '2025-05-21 16:29:38.771');
INSERT INTO public.order_items VALUES (93, 40, 5, 5, 349.99, 1749.95, '2025-05-21 16:29:38.787', '2025-05-21 16:29:38.787');
INSERT INTO public.order_items VALUES (94, 40, 11, 4, 899.99, 3599.96, '2025-05-21 16:29:38.805', '2025-05-21 16:29:38.805');
INSERT INTO public.order_items VALUES (95, 41, 10, 6, 179.99, 1079.94, '2025-05-21 16:29:38.869', '2025-05-21 16:29:38.869');
INSERT INTO public.order_items VALUES (96, 41, 9, 8, 299.99, 2399.92, '2025-05-21 16:29:38.885', '2025-05-21 16:29:38.885');
INSERT INTO public.order_items VALUES (97, 42, 4, 1, 129.99, 129.99, '2025-05-21 16:29:38.933', '2025-05-21 16:29:38.933');
INSERT INTO public.order_items VALUES (98, 42, 3, 8, 599.99, 4799.92, '2025-05-21 16:29:38.949', '2025-05-21 16:29:38.949');
INSERT INTO public.order_items VALUES (99, 42, 14, 8, 69.99, 559.92, '2025-05-21 16:29:38.965', '2025-05-21 16:29:38.965');
INSERT INTO public.order_items VALUES (100, 42, 17, 2, 129.99, 259.98, '2025-05-21 16:29:38.981', '2025-05-21 16:29:38.981');
INSERT INTO public.order_items VALUES (101, 43, 2, 7, 249.99, 1749.93, '2025-05-21 16:29:39.028', '2025-05-21 16:29:39.028');
INSERT INTO public.order_items VALUES (102, 43, 18, 6, 149.99, 899.94, '2025-05-21 16:29:39.044', '2025-05-21 16:29:39.044');
INSERT INTO public.order_items VALUES (103, 43, 14, 8, 69.99, 559.92, '2025-05-21 16:29:39.06', '2025-05-21 16:29:39.06');
INSERT INTO public.order_items VALUES (104, 44, 1, 4, 1299.99, 5199.96, '2025-05-21 16:29:39.108', '2025-05-21 16:29:39.108');
INSERT INTO public.order_items VALUES (105, 44, 6, 3, 89.99, 269.96999999999997, '2025-05-21 16:29:39.124', '2025-05-21 16:29:39.124');
INSERT INTO public.order_items VALUES (106, 44, 13, 6, 999.99, 5999.9400000000005, '2025-05-21 16:29:39.139', '2025-05-21 16:29:39.139');
INSERT INTO public.order_items VALUES (107, 45, 15, 2, 39.99, 79.98, '2025-05-21 16:29:39.187', '2025-05-21 16:29:39.187');
INSERT INTO public.order_items VALUES (108, 45, 9, 3, 299.99, 899.97, '2025-05-21 16:29:39.202', '2025-05-21 16:29:39.202');
INSERT INTO public.order_items VALUES (109, 45, 13, 1, 999.99, 999.99, '2025-05-21 16:29:39.224', '2025-05-21 16:29:39.224');
INSERT INTO public.order_items VALUES (110, 45, 12, 8, 499.99, 3999.92, '2025-05-21 16:29:39.24', '2025-05-21 16:29:39.24');
INSERT INTO public.order_items VALUES (111, 45, 18, 1, 149.99, 149.99, '2025-05-21 16:29:39.256', '2025-05-21 16:29:39.256');
INSERT INTO public.order_items VALUES (112, 46, 17, 8, 129.99, 1039.92, '2025-05-21 16:29:39.305', '2025-05-21 16:29:39.305');
INSERT INTO public.order_items VALUES (113, 46, 18, 2, 149.99, 299.98, '2025-05-21 16:29:39.322', '2025-05-21 16:29:39.322');
INSERT INTO public.order_items VALUES (114, 46, 10, 5, 179.99, 899.95, '2025-05-21 16:29:39.338', '2025-05-21 16:29:39.338');
INSERT INTO public.order_items VALUES (115, 47, 1, 8, 1299.99, 10399.92, '2025-05-21 16:29:39.386', '2025-05-21 16:29:39.386');
INSERT INTO public.order_items VALUES (116, 47, 6, 5, 89.99, 449.95, '2025-05-21 16:29:39.401', '2025-05-21 16:29:39.401');
INSERT INTO public.order_items VALUES (117, 48, 6, 5, 89.99, 449.95, '2025-05-21 16:29:39.448', '2025-05-21 16:29:39.448');
INSERT INTO public.order_items VALUES (118, 48, 5, 1, 349.99, 349.99, '2025-05-21 16:29:39.464', '2025-05-21 16:29:39.464');
INSERT INTO public.order_items VALUES (119, 48, 14, 1, 69.99, 69.99, '2025-05-21 16:29:39.48', '2025-05-21 16:29:39.48');
INSERT INTO public.order_items VALUES (120, 49, 3, 2, 599.99, 1199.98, '2025-05-21 16:29:39.543', '2025-05-21 16:29:39.543');
INSERT INTO public.order_items VALUES (121, 50, 3, 7, 599.99, 4199.93, '2025-05-21 16:29:39.605', '2025-05-21 16:29:39.605');
INSERT INTO public.order_items VALUES (122, 50, 16, 10, 59.99, 599.9, '2025-05-21 16:29:39.622', '2025-05-21 16:29:39.622');
INSERT INTO public.order_items VALUES (123, 51, 17, 10, 129.99, 1299.9, '2025-05-21 16:29:39.669', '2025-05-21 16:29:39.669');
INSERT INTO public.order_items VALUES (124, 51, 4, 9, 129.99, 1169.91, '2025-05-21 16:29:39.685', '2025-05-21 16:29:39.685');
INSERT INTO public.order_items VALUES (125, 51, 8, 4, 79.99, 319.96, '2025-05-21 16:29:39.701', '2025-05-21 16:29:39.701');
INSERT INTO public.order_items VALUES (126, 51, 9, 3, 299.99, 899.97, '2025-05-21 16:29:39.718', '2025-05-21 16:29:39.718');
INSERT INTO public.order_items VALUES (127, 51, 3, 5, 599.99, 2999.95, '2025-05-21 16:29:39.733', '2025-05-21 16:29:39.733');
INSERT INTO public.order_items VALUES (128, 52, 14, 8, 69.99, 559.92, '2025-05-21 16:29:39.781', '2025-05-21 16:29:39.781');
INSERT INTO public.order_items VALUES (129, 52, 1, 4, 1299.99, 5199.96, '2025-05-21 16:29:39.796', '2025-05-21 16:29:39.796');
INSERT INTO public.order_items VALUES (130, 52, 20, 10, 399.99, 3999.9, '2025-05-21 16:29:39.812', '2025-05-21 16:29:39.812');
INSERT INTO public.order_items VALUES (131, 52, 3, 9, 599.99, 5399.91, '2025-05-21 16:29:39.828', '2025-05-21 16:29:39.828');


--
-- Data for Name: work_centers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.work_centers VALUES (1, 'WC-ASM-01', 'Primary Assembly Line', 1, 'Main assembly line for final product assembly with automated stations', 120.00, 'units/day', 65.75, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'active', NULL, NULL);
INSERT INTO public.work_centers VALUES (2, 'WC-ASM-02', 'Secondary Assembly', 1, 'Manual assembly operations for complex components', 85.00, 'units/day', 48.50, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'active', NULL, NULL);
INSERT INTO public.work_centers VALUES (3, 'WC-SUBASM', 'Sub-Assembly Station', 2, 'Pre-assembly of component groups before main assembly', 200.00, 'units/day', 42.25, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'active', NULL, NULL);
INSERT INTO public.work_centers VALUES (4, 'WC-MCH-01', 'CNC Machining Center', 2, 'Precision CNC machining for critical components', 65.00, 'units/day', 78.50, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'active', NULL, NULL);
INSERT INTO public.work_centers VALUES (5, 'WC-MCH-02', 'Milling Station', 3, 'Multi-axis milling operations for complex geometries', 40.00, 'units/day', 82.75, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'active', NULL, NULL);
INSERT INTO public.work_centers VALUES (6, 'WC-QC-01', 'Quality Inspection', 1, 'Manual and automated quality inspection station', 180.00, 'units/day', 45.25, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'active', NULL, NULL);
INSERT INTO public.work_centers VALUES (7, 'WC-PKG-01', 'Packaging Line', 1, 'Automated packaging system for finished products', 200.00, 'units/day', 38.75, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'active', NULL, NULL);
INSERT INTO public.work_centers VALUES (8, 'WC-WELD-01', 'Robotic Welding', 4, 'Automated welding cells for consistent high-quality joints', 60.00, 'units/day', 72.25, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'active', NULL, NULL);
INSERT INTO public.work_centers VALUES (9, 'WC-LASER', 'Laser Cutting Station', 5, 'Precision laser cutting for sheet materials', 70.00, 'units/day', 92.50, true, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'maintenance', NULL, NULL);
INSERT INTO public.work_centers VALUES (10, 'WC-3DPRINT', 'Additive Manufacturing', 6, '3D printing facility for prototypes and small production runs', 30.00, 'units/day', 105.75, false, '2025-05-21 02:02:30.35722', '2025-05-21 02:02:30.35722', 'inactive', NULL, NULL);
INSERT INTO public.work_centers VALUES (11, 'WC-W001A', 'Assembly Line - East Coast Warehouse', 2, 'Main assembly line for East Coast Warehouse', 480.00, NULL, NULL, true, '2025-05-21 14:57:16.95612', '2025-05-21 14:57:16.95612', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (12, 'WC-p001A', 'Assembly Line - plant South East', 4, 'Main assembly line for plant South East', 480.00, NULL, NULL, true, '2025-05-21 14:57:16.95612', '2025-05-21 14:57:16.95612', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (13, 'WC-P004A', 'Assembly Line - Shanghai Facility', 6, 'Main assembly line for Shanghai Facility', 480.00, NULL, NULL, true, '2025-05-21 14:57:16.95612', '2025-05-21 14:57:16.95612', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (14, 'WC-P003A', 'Assembly Line - Berlin Production', 5, 'Main assembly line for Berlin Production', 480.00, NULL, NULL, true, '2025-05-21 14:57:16.95612', '2025-05-21 14:57:16.95612', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (15, 'WC-P001A', 'Assembly Line - Main Factory', 1, 'Main assembly line for Main Factory', 480.00, NULL, NULL, true, '2025-05-21 14:57:16.95612', '2025-05-21 14:57:16.95612', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (16, 'WC-W003P', 'Packaging - Asian Distribution Hub', 8, 'Packaging workstation for Asian Distribution Hub', 960.00, NULL, NULL, true, '2025-05-21 14:57:26.598637', '2025-05-21 14:57:26.598637', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (17, 'WC-P004P', 'Packaging - Shanghai Facility', 6, 'Packaging workstation for Shanghai Facility', 960.00, NULL, NULL, true, '2025-05-21 14:57:26.598637', '2025-05-21 14:57:26.598637', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (18, 'WC-p001P', 'Packaging - plant South East', 4, 'Packaging workstation for plant South East', 960.00, NULL, NULL, true, '2025-05-21 14:57:26.598637', '2025-05-21 14:57:26.598637', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (19, 'WC-W004P', 'Packaging - UK Warehouse', 9, 'Packaging workstation for UK Warehouse', 960.00, NULL, NULL, true, '2025-05-21 14:57:26.598637', '2025-05-21 14:57:26.598637', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (20, 'WC-W001P', 'Packaging - East Coast Warehouse', 2, 'Packaging workstation for East Coast Warehouse', 960.00, NULL, NULL, true, '2025-05-21 14:57:26.598637', '2025-05-21 14:57:26.598637', 'ACTIVE', NULL, NULL);
INSERT INTO public.work_centers VALUES (21, 'WC-AB01', 'Abdul WC', 1, 'Abdul Workcenter Demo', 50.00, 'units/day', 50.00, true, '2025-05-21 16:40:07.940798', '2025-05-21 16:40:07.940798', 'active', NULL, NULL);


--
-- Data for Name: production_orders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.production_orders VALUES (1, 'PROD-2025-001', 1, NULL, NULL, 1, 'Production', 100.000, 85.000, 0.000, NULL, '2025-06-01', '2025-06-15', NULL, NULL, 'NORMAL', 'In Progress', NULL, NULL, NULL, NULL, NULL, '2025-06-04 01:16:16.078961');
INSERT INTO public.production_orders VALUES (2, 'PROD-2025-002', 2, NULL, NULL, 2, 'Production', 250.000, 250.000, 0.000, NULL, '2025-05-20', '2025-06-10', NULL, NULL, 'NORMAL', 'Completed', NULL, NULL, NULL, NULL, NULL, '2025-06-04 01:16:16.078961');
INSERT INTO public.production_orders VALUES (3, 'PROD-2025-003', 3, NULL, NULL, 3, 'Production', 150.000, 0.000, 0.000, NULL, '2025-06-10', '2025-06-25', NULL, NULL, 'NORMAL', 'Planned', NULL, NULL, NULL, NULL, NULL, '2025-06-04 01:16:16.078961');
INSERT INTO public.production_orders VALUES (4, 'PROD-2025-004', 4, NULL, NULL, 1, 'Production', 300.000, 180.000, 0.000, NULL, '2025-06-05', '2025-06-20', NULL, NULL, 'NORMAL', 'In Progress', NULL, NULL, NULL, NULL, NULL, '2025-06-04 01:16:16.078961');
INSERT INTO public.production_orders VALUES (5, 'PROD-2025-005', 5, NULL, NULL, 2, 'Production', 75.000, 75.000, 0.000, NULL, '2025-05-25', '2025-06-08', NULL, NULL, 'NORMAL', 'Completed', NULL, NULL, NULL, NULL, NULL, '2025-06-04 01:16:16.078961');


--
-- Data for Name: purchase_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.purchase_groups VALUES (1, 'MECH', 'Mechanical Parts', 'Procurement group for mechanical components and parts', true, '2025-05-20 03:25:48.01028', '2025-05-20 03:25:48.01028', NULL, NULL, 1, '2025-05-20 03:25:48.01028', NULL);
INSERT INTO public.purchase_groups VALUES (2, 'ELEC', 'Electrical Components', 'Procurement group for electrical components and supplies', true, '2025-05-20 03:25:48.01028', '2025-05-20 03:25:48.01028', NULL, NULL, 1, '2025-05-20 03:25:48.01028', NULL);
INSERT INTO public.purchase_groups VALUES (3, 'RAW', 'Raw Materials', 'Basic raw materials used in manufacturing processes', true, '2025-05-20 03:25:48.01028', '2025-05-20 03:25:48.01028', NULL, NULL, 1, '2025-05-20 03:25:48.01028', NULL);
INSERT INTO public.purchase_groups VALUES (4, 'PACK', 'Packaging Materials', 'Materials used for packaging finished products', true, '2025-05-20 03:25:48.01028', '2025-05-20 03:25:48.01028', NULL, NULL, 1, '2025-05-20 03:25:48.01028', NULL);
INSERT INTO public.purchase_groups VALUES (5, 'TOOL', 'Tools & Equipment', 'Tools and equipment for maintenance and operations', true, '2025-05-20 03:25:48.01028', '2025-05-20 03:25:48.01028', NULL, NULL, 1, '2025-05-20 03:25:48.01028', NULL);
INSERT INTO public.purchase_groups VALUES (6, 'PG001', 'Raw Materials', 'Purchasing group for raw materials procurement', true, '2025-05-20 04:52:27.386821', '2025-05-20 04:52:27.386821', NULL, NULL, 1, '2025-05-20 04:52:27.386821', NULL);
INSERT INTO public.purchase_groups VALUES (7, 'PG002', 'Production Equipment', 'Purchasing group for manufacturing equipment', true, '2025-05-20 04:52:27.427776', '2025-05-20 04:52:27.427776', NULL, NULL, 1, '2025-05-20 04:52:27.427776', NULL);
INSERT INTO public.purchase_groups VALUES (8, 'PG003', 'Office Supplies', 'Purchasing group for office and administrative supplies', true, '2025-05-20 04:52:27.459234', '2025-05-20 04:52:27.459234', NULL, NULL, 1, '2025-05-20 04:52:27.459234', NULL);
INSERT INTO public.purchase_groups VALUES (9, 'PG004', 'IT Hardware', 'Purchasing group for computers and IT equipment', true, '2025-05-20 04:52:27.490428', '2025-05-20 04:52:27.490428', NULL, NULL, 1, '2025-05-20 04:52:27.490428', NULL);
INSERT INTO public.purchase_groups VALUES (10, 'PG005', 'Packaging Materials', 'Purchasing group for packaging supplies', true, '2025-05-20 04:52:27.526279', '2025-05-20 04:52:27.526279', NULL, NULL, 1, '2025-05-20 04:52:27.526279', NULL);
INSERT INTO public.purchase_groups VALUES (11, 'PG006', 'Services', 'Purchasing group for third-party services', true, '2025-05-20 04:52:27.560699', '2025-05-20 04:52:27.560699', NULL, NULL, 1, '2025-05-20 04:52:27.560699', NULL);
INSERT INTO public.purchase_groups VALUES (12, 'PG007', 'Maintenance', 'Purchasing group for maintenance supplies and services', true, '2025-05-20 04:52:27.592969', '2025-05-20 04:52:27.592969', NULL, NULL, 1, '2025-05-20 04:52:27.592969', NULL);


--
-- Data for Name: purchase_order_items; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: quotes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.quotes VALUES (1, 'Q-10000', 4, NULL, 'Draft', '2025-07-20 23:38:47.725', 31422.69, 123.42, 2190.95, 33490.22, 'Net 30 days from invoice date', 'Quote for Taylor Consulting - Professional Services Solution', NULL, 'Pending', NULL, NULL, NULL, '2025-05-21 23:38:47.735855', '2025-05-21 23:38:47.735855');
INSERT INTO public.quotes VALUES (2, 'Q-10001', 6, NULL, 'Draft', '2025-07-20 23:38:47.725', 36841.54, 2387.72, 2411.77, 36865.58, 'Net 30 days from invoice date', 'Quote for White Industries - Manufacturing Solution', NULL, 'Pending', NULL, NULL, NULL, '2025-05-21 23:38:47.791841', '2025-05-21 23:38:47.791841');
INSERT INTO public.quotes VALUES (3, 'Q-10002', 7, NULL, 'Draft', '2025-07-20 23:38:47.725', 69242.43, 2302.19, 4685.82, 71626.05, 'Net 30 days from invoice date', 'Quote for Jones Retail - Retail Solution', NULL, 'Pending', NULL, NULL, NULL, '2025-05-21 23:38:47.827033', '2025-05-21 23:38:47.827033');
INSERT INTO public.quotes VALUES (4, 'Q-10003', 8, NULL, 'Draft', '2025-07-20 23:38:47.725', 86299.49, 7798.41, 5495.08, 83996.15, 'Net 30 days from invoice date', 'Quote for Clark Financial - Financial Services Solution', NULL, 'Pending', NULL, NULL, NULL, '2025-05-21 23:38:47.862695', '2025-05-21 23:38:47.862695');
INSERT INTO public.quotes VALUES (5, 'Q-10004', 13, NULL, 'Draft', '2025-07-20 23:38:47.725', 24764.53, 1062.54, 1659.14, 25361.13, 'Net 30 days from invoice date', 'Quote for Taylor Consulting - Additional Professional Services Project', NULL, 'Pending', NULL, NULL, NULL, '2025-05-21 23:38:47.899481', '2025-05-21 23:38:47.899481');
INSERT INTO public.quotes VALUES (6, 'Q-10005', 14, NULL, 'Draft', '2025-07-20 23:38:47.725', 14741.10, 1285.18, 941.92, 14397.84, 'Net 30 days from invoice date', 'Quote for Lee Education Services - Additional Education Project', NULL, 'Pending', NULL, NULL, NULL, '2025-05-21 23:38:47.952958', '2025-05-21 23:38:47.952958');
INSERT INTO public.quotes VALUES (7, 'Q-10006', 16, NULL, 'Draft', '2025-07-20 23:38:47.725', 14007.43, 1287.56, 890.39, 13610.26, 'Net 30 days from invoice date', 'Quote for Miller Tech Solutions - Additional Technology Project', NULL, 'Pending', NULL, NULL, NULL, '2025-05-21 23:38:47.988115', '2025-05-21 23:38:47.988115');


--
-- Data for Name: quote_approvals; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.quote_approvals VALUES (7, 7, 2, '2025-04-25 13:35:46.205', 'Rejected', NULL, NULL, NULL, 1, '2025-04-28 13:35:46.205', 'Price is too high or terms need adjustment.', 'Quote needs revision.', 'Level 3', '2025-05-22 13:35:46.206', '2025-05-22 13:35:46.206');
INSERT INTO public.quote_approvals VALUES (8, 5, 1, '2025-05-12 13:35:46.235', 'Rejected', NULL, NULL, NULL, 2, '2025-05-17 13:35:46.235', 'Price is too high or terms need adjustment.', 'Quote needs revision.', 'Level 2', '2025-05-22 13:35:46.235', '2025-05-22 13:35:46.235');
INSERT INTO public.quote_approvals VALUES (9, 7, 2, '2025-05-15 13:35:46.254', 'In Review', 2, NULL, NULL, NULL, NULL, NULL, 'Currently reviewing details.', 'Level 2', '2025-05-22 13:35:46.254', '2025-05-22 13:35:46.254');
INSERT INTO public.quote_approvals VALUES (10, 7, 1, '2025-04-25 13:35:46.271', 'In Review', 1, NULL, NULL, NULL, NULL, NULL, 'Currently reviewing details.', 'Level 3', '2025-05-22 13:35:46.271', '2025-05-22 13:35:46.271');
INSERT INTO public.quote_approvals VALUES (11, 6, 2, '2025-05-17 13:35:46.293', 'Rejected', NULL, NULL, NULL, 3, '2025-05-21 13:35:46.293', 'Price is too high or terms need adjustment.', 'Quote needs revision.', 'Level 2', '2025-05-22 13:35:46.293', '2025-05-22 13:35:46.293');
INSERT INTO public.quote_approvals VALUES (12, 1, 1, '2025-05-22 13:35:46.329', 'Approved', NULL, 1, '2025-05-23 13:35:46.329', NULL, NULL, NULL, 'Quote looks good, approved.', 'Level 2', '2025-05-22 13:35:46.329', '2025-05-22 13:35:46.329');
INSERT INTO public.quote_approvals VALUES (13, 7, 2, '2025-05-05 13:35:46.346', 'Approved', NULL, 3, '2025-05-08 13:35:46.346', NULL, NULL, NULL, 'Quote looks good, approved.', 'Level 1', '2025-05-22 13:35:46.346', '2025-05-22 13:35:46.346');
INSERT INTO public.quote_approvals VALUES (14, 2, 1, '2025-04-27 13:35:46.363', 'In Review', 2, NULL, NULL, NULL, NULL, NULL, 'Currently reviewing details.', 'Level 2', '2025-05-22 13:35:46.363', '2025-05-22 13:35:46.363');
INSERT INTO public.quote_approvals VALUES (15, 1, 2, '2025-05-04 13:35:46.385', 'Pending', 2, NULL, NULL, NULL, NULL, NULL, 'Awaiting review', 'Level 2', '2025-05-22 13:35:46.385', '2025-05-22 13:35:46.385');
INSERT INTO public.quote_approvals VALUES (16, 2, 1, '2025-04-23 13:35:46.404', 'In Review', 2, NULL, NULL, NULL, NULL, NULL, 'Currently reviewing details.', 'Level 3', '2025-05-22 13:35:46.404', '2025-05-22 13:35:46.404');


--
-- Data for Name: quote_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.quote_items VALUES (1, 1, 13, 'Desktop PC', 4, 999.99, 1.00, 7.00, 4237.16, '2025-05-21 23:38:47.755728', '2025-05-21 23:38:47.755728');
INSERT INTO public.quote_items VALUES (2, 1, 11, 'Smartphone', 4, 899.99, 2.00, 7.00, 3774.92, '2025-05-21 23:38:47.774319', '2025-05-21 23:38:47.774319');
INSERT INTO public.quote_items VALUES (3, 2, 1, 'Premium Laptop', 4, 1299.99, 8.00, 7.00, 5118.84, '2025-05-21 23:38:47.809738', '2025-05-21 23:38:47.809738');
INSERT INTO public.quote_items VALUES (4, 3, 18, 'Router', 1, 149.99, 0.00, 7.00, 160.49, '2025-05-21 23:38:47.844784', '2025-05-21 23:38:47.844784');
INSERT INTO public.quote_items VALUES (5, 4, 8, 'Bluetooth Speaker', 1, 79.99, 7.00, 7.00, 79.60, '2025-05-21 23:38:47.88047', '2025-05-21 23:38:47.88047');
INSERT INTO public.quote_items VALUES (6, 5, 1, 'Premium Laptop', 2, 1299.99, 6.00, 7.00, 2615.06, '2025-05-21 23:38:47.917178', '2025-05-21 23:38:47.917178');
INSERT INTO public.quote_items VALUES (7, 5, 16, 'Webcam', 4, 59.99, 7.00, 7.00, 238.78, '2025-05-21 23:38:47.935082', '2025-05-21 23:38:47.935082');
INSERT INTO public.quote_items VALUES (8, 6, 5, 'Smart Watch', 1, 349.99, 8.00, 7.00, 344.53, '2025-05-21 23:38:47.970515', '2025-05-21 23:38:47.970515');
INSERT INTO public.quote_items VALUES (9, 7, 18, 'Router', 1, 149.99, 8.00, 7.00, 147.65, '2025-05-21 23:38:48.005675', '2025-05-21 23:38:48.005675');
INSERT INTO public.quote_items VALUES (10, 7, 16, 'Webcam', 1, 59.99, 4.00, 7.00, 61.62, '2025-05-21 23:38:48.023953', '2025-05-21 23:38:48.023953');


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.reports VALUES (1, 'Sales by Month', 'Monthly sales revenue analysis', 'SELECT 
        DATE_TRUNC(''month'', order_date) as month,
        COUNT(*) as order_count,
        SUM(total_amount) as total_revenue
    FROM sales_orders 
    WHERE order_date >= CURRENT_DATE - INTERVAL ''12 months''
    GROUP BY DATE_TRUNC(''month'', order_date)
    ORDER BY month', '{"type": "line", "xAxis": "month", "yAxis": "total_revenue", "showLegend": true}', 'sales', '2025-06-04 17:17:13.453916', '2025-06-04 17:17:13.453916');
INSERT INTO public.reports VALUES (2, 'Top Customers by Revenue', 'Customers with highest revenue contribution', 'SELECT 
        c.name as customer_name,
        COUNT(so.id) as order_count,
        SUM(so.total_amount) as total_revenue
    FROM customers c
    JOIN sales_orders so ON c.id = so.customer_id
    GROUP BY c.id, c.name
    ORDER BY total_revenue DESC
    LIMIT 10', '{"type": "bar", "xAxis": "customer_name", "yAxis": "total_revenue", "showLegend": false}', 'sales', '2025-06-04 17:17:13.453916', '2025-06-04 17:17:13.453916');
INSERT INTO public.reports VALUES (3, 'Inventory Levels by Category', 'Current inventory levels grouped by material category', 'SELECT 
        cat.name as category_name,
        COUNT(m.id) as material_count,
        SUM(inv.quantity) as total_quantity
    FROM categories cat
    JOIN materials m ON cat.id = m.category_id
    JOIN inventory inv ON m.id = inv.material_id
    GROUP BY cat.id, cat.name
    ORDER BY total_quantity DESC', '{"type": "pie", "dataKey": "total_quantity", "nameKey": "category_name", "showLegend": true}', 'inventory', '2025-06-04 17:17:13.453916', '2025-06-04 17:17:13.453916');
INSERT INTO public.reports VALUES (4, 'Cost Center Expenses', 'Expenses by cost center for current year', 'SELECT 
        cc.name as cost_center,
        SUM(e.amount) as total_expenses
    FROM cost_centers cc
    LEFT JOIN expenses e ON cc.id = e.cost_center_id
    WHERE e.expense_date >= DATE_TRUNC(''year'', CURRENT_DATE)
    GROUP BY cc.id, cc.name
    ORDER BY total_expenses DESC', '{"type": "bar", "xAxis": "cost_center", "yAxis": "total_expenses", "showLegend": false}', 'finance', '2025-06-04 17:17:13.453916', '2025-06-04 17:17:13.453916');
INSERT INTO public.reports VALUES (5, 'Purchase Orders by Vendor', 'Purchase order volumes by vendor', 'SELECT 
        v.name as vendor_name,
        COUNT(po.id) as order_count,
        SUM(po.total_amount) as total_amount
    FROM vendors v
    JOIN purchase_orders po ON v.id = po.vendor_id
    WHERE po.order_date >= CURRENT_DATE - INTERVAL ''6 months''
    GROUP BY v.id, v.name
    ORDER BY total_amount DESC
    LIMIT 10', '{"type": "bar", "xAxis": "vendor_name", "yAxis": "total_amount", "showLegend": false}', 'purchase', '2025-06-04 17:17:13.453916', '2025-06-04 17:17:13.453916');


--
-- Data for Name: sales_customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_customers VALUES (1, 'CUST-1001', 'TechNova Inc', 'John Smith', 'john.smith@technova.com', '(555) 123-4567', 'www.technova.com', 'Technology', 'Business', NULL, NULL, NULL, NULL, 50000.00, 'Active', NULL, '2025-05-23 02:20:10.071348+00', '2025-05-23 02:20:10.071348+00');
INSERT INTO public.sales_customers VALUES (2, 'CUST-1002', 'Elevate Solutions', 'Sarah Johnson', 'sarah@elevatesolutions.com', '(555) 234-5678', 'www.elevatesolutions.com', 'Consulting', 'Business', NULL, NULL, NULL, NULL, 35000.00, 'Active', NULL, '2025-05-23 02:20:10.071348+00', '2025-05-23 02:20:10.071348+00');
INSERT INTO public.sales_customers VALUES (3, 'CUST-1003', 'DataWave Analytics', 'Michael Chen', 'michael@datawave.com', '(555) 345-6789', 'www.datawave.com', 'Data Services', 'Business', NULL, NULL, NULL, NULL, 75000.00, 'Active', NULL, '2025-05-23 02:20:10.071348+00', '2025-05-23 02:20:10.071348+00');
INSERT INTO public.sales_customers VALUES (4, 'CUST-1004', 'Quantum Systems', 'Emily Rodriguez', 'emily@quantumsystems.com', '(555) 456-7890', 'www.quantumsystems.com', 'Manufacturing', 'Business', NULL, NULL, NULL, NULL, 100000.00, 'Active', NULL, '2025-05-23 02:20:10.071348+00', '2025-05-23 02:20:10.071348+00');
INSERT INTO public.sales_customers VALUES (5, 'CUST-1005', 'Arctic Innovations', 'David Wilson', 'david@arcticinnovations.com', '(555) 567-8901', 'www.arcticinnovations.com', 'Research', 'Business', NULL, NULL, NULL, NULL, 25000.00, 'Active', NULL, '2025-05-23 02:20:10.071348+00', '2025-05-23 02:20:10.071348+00');
INSERT INTO public.sales_customers VALUES (6, 'CUST-1006', 'Sunrise Healthcare', 'Lisa Morgan', 'lisa@sunrisehealthcare.com', '(555) 678-9012', 'www.sunrisehealthcare.com', 'Healthcare', 'Business', NULL, NULL, NULL, NULL, 40000.00, 'Inactive', NULL, '2025-05-23 02:20:10.071348+00', '2025-05-23 02:20:10.071348+00');
INSERT INTO public.sales_customers VALUES (7, 'CUST-1007', 'Velocity Logistics', 'Robert Brown', 'robert@velocitylogistics.com', '(555) 789-0123', 'www.velocitylogistics.com', 'Transportation', 'Business', NULL, NULL, NULL, NULL, 60000.00, 'Active', NULL, '2025-05-23 02:20:10.071348+00', '2025-05-23 02:20:10.071348+00');


--
-- Data for Name: sales_customer_contacts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_customer_contacts VALUES (1, 1, 'John Smith', 'Primary Contact', 'john.smith@technova.com', '(555) 123-4567', true, NULL, '2025-05-23 02:20:10.142606+00', '2025-05-23 02:20:10.142606+00');
INSERT INTO public.sales_customer_contacts VALUES (2, 2, 'Sarah Johnson', 'Primary Contact', 'sarah@elevatesolutions.com', '(555) 234-5678', true, NULL, '2025-05-23 02:20:10.160107+00', '2025-05-23 02:20:10.160107+00');
INSERT INTO public.sales_customer_contacts VALUES (3, 2, 'Tom Baker', 'Finance Director', 'tom@elevatesolutions.com', '(555) 541-3019', false, NULL, '2025-05-23 02:20:10.176177+00', '2025-05-23 02:20:10.176177+00');
INSERT INTO public.sales_customer_contacts VALUES (4, 3, 'Michael Chen', 'Primary Contact', 'michael@datawave.com', '(555) 345-6789', true, NULL, '2025-05-23 02:20:10.192015+00', '2025-05-23 02:20:10.192015+00');
INSERT INTO public.sales_customer_contacts VALUES (5, 3, 'Tom Baker', 'Technical Lead', 'tom@datawave.com', '(555) 736-3307', false, NULL, '2025-05-23 02:20:10.207854+00', '2025-05-23 02:20:10.207854+00');
INSERT INTO public.sales_customer_contacts VALUES (6, 4, 'Emily Rodriguez', 'Primary Contact', 'emily@quantumsystems.com', '(555) 456-7890', true, NULL, '2025-05-23 02:20:10.223908+00', '2025-05-23 02:20:10.223908+00');
INSERT INTO public.sales_customer_contacts VALUES (7, 4, 'Jessica Lee', 'Technical Lead', 'jessica@quantumsystems.com', '(555) 464-2074', false, NULL, '2025-05-23 02:20:10.240059+00', '2025-05-23 02:20:10.240059+00');
INSERT INTO public.sales_customer_contacts VALUES (8, 5, 'David Wilson', 'Primary Contact', 'david@arcticinnovations.com', '(555) 567-8901', true, NULL, '2025-05-23 02:20:10.257459+00', '2025-05-23 02:20:10.257459+00');
INSERT INTO public.sales_customer_contacts VALUES (9, 5, 'Jessica Lee', 'Technical Lead', 'jessica@arcticinnovations.com', '(555) 186-3388', false, NULL, '2025-05-23 02:20:10.273451+00', '2025-05-23 02:20:10.273451+00');
INSERT INTO public.sales_customer_contacts VALUES (10, 6, 'Lisa Morgan', 'Primary Contact', 'lisa@sunrisehealthcare.com', '(555) 678-9012', true, NULL, '2025-05-23 02:20:10.289534+00', '2025-05-23 02:20:10.289534+00');
INSERT INTO public.sales_customer_contacts VALUES (11, 7, 'Robert Brown', 'Primary Contact', 'robert@velocitylogistics.com', '(555) 789-0123', true, NULL, '2025-05-23 02:20:10.305579+00', '2025-05-23 02:20:10.305579+00');


--
-- Data for Name: sales_invoices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_invoices VALUES (1, 'INV-2025-1001', NULL, 'TechNova Inc', '2025-05-03 02:20:07.072407+00', '2025-05-18 02:20:07.072407+00', 'Paid', 5649.75, 0.00, 0.00, 5932.24, 5932.24, 'Credit Card', '2025-05-16 02:20:07.072407+00', NULL, NULL, '2025-05-23 02:20:07.072407+00', '2025-05-23 02:20:07.072407+00');
INSERT INTO public.sales_invoices VALUES (2, 'INV-2025-1002', NULL, 'Elevate Solutions', '2025-05-05 02:20:07.072407+00', '2025-05-20 02:20:07.072407+00', 'Paid', 2375.50, 0.00, 0.00, 2494.28, 2494.28, 'Bank Transfer', '2025-05-17 02:20:07.072407+00', NULL, NULL, '2025-05-23 02:20:07.072407+00', '2025-05-23 02:20:07.072407+00');
INSERT INTO public.sales_invoices VALUES (3, 'INV-2025-1003', NULL, 'DataWave Analytics', '2025-05-08 02:20:07.072407+00', '2025-06-07 02:20:07.072407+00', 'Partially Paid', 8925.33, 0.00, 0.00, 9371.60, 4000.00, 'Bank Transfer', '2025-05-13 02:20:07.072407+00', NULL, NULL, '2025-05-23 02:20:07.072407+00', '2025-05-23 02:20:07.072407+00');
INSERT INTO public.sales_invoices VALUES (4, 'INV-2025-1004', NULL, 'Quantum Systems', '2025-05-13 02:20:07.072407+00', '2025-06-12 02:20:07.072407+00', 'Unpaid', 3450.20, 0.00, 0.00, 3622.71, 0.00, NULL, NULL, NULL, NULL, '2025-05-23 02:20:07.072407+00', '2025-05-23 02:20:07.072407+00');
INSERT INTO public.sales_invoices VALUES (5, 'INV-2025-1005', NULL, 'Arctic Innovations', '2025-05-16 02:20:07.072407+00', '2025-06-15 02:20:07.072407+00', 'Unpaid', 1875.60, 0.00, 0.00, 1969.38, 0.00, NULL, NULL, NULL, NULL, '2025-05-23 02:20:07.072407+00', '2025-05-23 02:20:07.072407+00');


--
-- Data for Name: sales_invoice_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_invoice_items VALUES (1, 1, 'Enterprise SaaS License', 'Annual subscription', 5, 1299.99, 0.00, 0.00, 6499.95, '2025-05-23 02:20:07.133409+00', '2025-05-23 02:20:07.133409+00');
INSERT INTO public.sales_invoice_items VALUES (2, 2, 'Network Infrastructure', 'Network hardware and setup', 2, 2499.50, 0.00, 0.00, 4999.00, '2025-05-23 02:20:07.151846+00', '2025-05-23 02:20:07.151846+00');
INSERT INTO public.sales_invoice_items VALUES (3, 3, 'Data Analytics Platform', 'Business intelligence tools', 1, 1499.75, 0.00, 0.00, 1499.75, '2025-05-23 02:20:07.167522+00', '2025-05-23 02:20:07.167522+00');
INSERT INTO public.sales_invoice_items VALUES (4, 3, 'Data Analytics Platform', 'Business intelligence tools', 3, 1499.75, 0.00, 0.00, 4499.25, '2025-05-23 02:20:07.183249+00', '2025-05-23 02:20:07.183249+00');
INSERT INTO public.sales_invoice_items VALUES (5, 3, 'Cloud Security Package', 'Advanced security suite', 4, 899.50, 0.00, 0.00, 3598.00, '2025-05-23 02:20:07.198912+00', '2025-05-23 02:20:07.198912+00');
INSERT INTO public.sales_invoice_items VALUES (6, 4, 'Cloud Security Package', 'Advanced security suite', 5, 899.50, 0.00, 0.00, 4497.50, '2025-05-23 02:20:07.214642+00', '2025-05-23 02:20:07.214642+00');
INSERT INTO public.sales_invoice_items VALUES (7, 4, 'Cloud Security Package', 'Advanced security suite', 4, 899.50, 0.00, 0.00, 3598.00, '2025-05-23 02:20:07.230456+00', '2025-05-23 02:20:07.230456+00');
INSERT INTO public.sales_invoice_items VALUES (8, 5, 'Mobile Device Management', 'Enterprise mobility solution', 1, 699.99, 0.00, 0.00, 699.99, '2025-05-23 02:20:07.246834+00', '2025-05-23 02:20:07.246834+00');
INSERT INTO public.sales_invoice_items VALUES (9, 5, 'Mobile Device Management', 'Enterprise mobility solution', 3, 699.99, 0.00, 0.00, 2099.97, '2025-05-23 02:20:07.262681+00', '2025-05-23 02:20:07.262681+00');


--
-- Data for Name: sales_order_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_order_items VALUES (1, 1, NULL, 'Network Infrastructure', 4, 2499.50, 0.00, 0.00, 9998.00, '2025-05-23 02:19:58.99797+00', '2025-05-23 02:19:58.99797+00');
INSERT INTO public.sales_order_items VALUES (2, 1, NULL, 'Enterprise SaaS License', 4, 1299.99, 0.00, 0.00, 5199.96, '2025-05-23 02:19:59.015933+00', '2025-05-23 02:19:59.015933+00');
INSERT INTO public.sales_order_items VALUES (3, 2, NULL, 'Cloud Security Package', 5, 899.50, 0.00, 0.00, 4497.50, '2025-05-23 02:19:59.031645+00', '2025-05-23 02:19:59.031645+00');
INSERT INTO public.sales_order_items VALUES (4, 3, NULL, 'Enterprise SaaS License', 5, 1299.99, 0.00, 0.00, 6499.95, '2025-05-23 02:19:59.047403+00', '2025-05-23 02:19:59.047403+00');
INSERT INTO public.sales_order_items VALUES (5, 3, NULL, 'Enterprise SaaS License', 5, 1299.99, 0.00, 0.00, 6499.95, '2025-05-23 02:19:59.063361+00', '2025-05-23 02:19:59.063361+00');
INSERT INTO public.sales_order_items VALUES (6, 4, NULL, 'Cloud Security Package', 3, 899.50, 0.00, 0.00, 2698.50, '2025-05-23 02:19:59.07912+00', '2025-05-23 02:19:59.07912+00');
INSERT INTO public.sales_order_items VALUES (7, 4, NULL, 'Cloud Security Package', 5, 899.50, 0.00, 0.00, 4497.50, '2025-05-23 02:19:59.094803+00', '2025-05-23 02:19:59.094803+00');
INSERT INTO public.sales_order_items VALUES (8, 4, NULL, 'Data Analytics Platform', 5, 1499.75, 0.00, 0.00, 7498.75, '2025-05-23 02:19:59.110759+00', '2025-05-23 02:19:59.110759+00');
INSERT INTO public.sales_order_items VALUES (9, 5, NULL, 'Data Analytics Platform', 4, 1499.75, 0.00, 0.00, 5999.00, '2025-05-23 02:19:59.126744+00', '2025-05-23 02:19:59.126744+00');
INSERT INTO public.sales_order_items VALUES (10, 5, NULL, 'Enterprise SaaS License', 3, 1299.99, 0.00, 0.00, 3899.97, '2025-05-23 02:19:59.142363+00', '2025-05-23 02:19:59.142363+00');
INSERT INTO public.sales_order_items VALUES (11, 5, NULL, 'Enterprise SaaS License', 5, 1299.99, 0.00, 0.00, 6499.95, '2025-05-23 02:19:59.158064+00', '2025-05-23 02:19:59.158064+00');


--
-- Data for Name: sales_quotes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_quotes VALUES (1, 'QT-2025-1001', NULL, 'TechNova Inc', '2025-05-08 02:20:05.38177+00', '2025-07-07 02:20:05.38177+00', 'Sent', 6200.00, 0.00, 0.00, 6510.00, NULL, 'Net 30 payment terms. Quoted prices valid for 60 days.', NULL, '2025-05-23 02:20:05.38177+00', '2025-05-23 02:20:05.38177+00');
INSERT INTO public.sales_quotes VALUES (2, 'QT-2025-1002', NULL, 'Elevate Solutions', '2025-05-11 02:20:05.38177+00', '2025-07-10 02:20:05.38177+00', 'Draft', 3750.50, 0.00, 0.00, 3938.03, NULL, 'Net 30 payment terms. Quoted prices valid for 60 days.', NULL, '2025-05-23 02:20:05.38177+00', '2025-05-23 02:20:05.38177+00');
INSERT INTO public.sales_quotes VALUES (3, 'QT-2025-1003', NULL, 'DataWave Analytics', '2025-05-13 02:20:05.38177+00', '2025-07-12 02:20:05.38177+00', 'Approved', 9200.00, 0.00, 0.00, 9660.00, NULL, 'Net 30 payment terms. Quoted prices valid for 60 days.', NULL, '2025-05-23 02:20:05.38177+00', '2025-05-23 02:20:05.38177+00');
INSERT INTO public.sales_quotes VALUES (4, 'QT-2025-1004', NULL, 'Quantum Systems', '2025-05-16 02:20:05.38177+00', '2025-07-15 02:20:05.38177+00', 'Rejected', 4800.75, 0.00, 0.00, 5040.79, NULL, 'Net 30 payment terms. Quoted prices valid for 60 days.', NULL, '2025-05-23 02:20:05.38177+00', '2025-05-23 02:20:05.38177+00');
INSERT INTO public.sales_quotes VALUES (5, 'QT-2025-1005', NULL, 'Arctic Innovations', '2025-05-18 02:20:05.38177+00', '2025-07-17 02:20:05.38177+00', 'Sent', 2350.25, 0.00, 0.00, 2467.76, NULL, 'Net 30 payment terms. Quoted prices valid for 60 days.', NULL, '2025-05-23 02:20:05.38177+00', '2025-05-23 02:20:05.38177+00');


--
-- Data for Name: sales_quote_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_quote_items VALUES (1, 1, 'Technical Support Plan', '24/7 technical support', 2, 499.99, 0.00, 0.00, 999.98, '2025-05-23 02:20:05.446439+00', '2025-05-23 02:20:05.446439+00');
INSERT INTO public.sales_quote_items VALUES (2, 1, 'Cloud Security Package', 'Advanced security suite', 5, 899.50, 0.00, 0.00, 4497.50, '2025-05-23 02:20:05.464681+00', '2025-05-23 02:20:05.464681+00');
INSERT INTO public.sales_quote_items VALUES (3, 2, 'Data Analytics Platform', 'Business intelligence tools', 3, 1499.75, 0.00, 0.00, 4499.25, '2025-05-23 02:20:05.481121+00', '2025-05-23 02:20:05.481121+00');
INSERT INTO public.sales_quote_items VALUES (4, 2, 'Network Infrastructure', 'Network hardware and setup', 3, 2499.50, 0.00, 0.00, 7498.50, '2025-05-23 02:20:05.497218+00', '2025-05-23 02:20:05.497218+00');
INSERT INTO public.sales_quote_items VALUES (5, 2, 'Data Analytics Platform', 'Business intelligence tools', 3, 1499.75, 0.00, 0.00, 4499.25, '2025-05-23 02:20:05.513114+00', '2025-05-23 02:20:05.513114+00');
INSERT INTO public.sales_quote_items VALUES (6, 3, 'Enterprise SaaS License', 'Annual subscription', 3, 1299.99, 0.00, 0.00, 3899.97, '2025-05-23 02:20:05.529484+00', '2025-05-23 02:20:05.529484+00');
INSERT INTO public.sales_quote_items VALUES (7, 4, 'Data Analytics Platform', 'Business intelligence tools', 2, 1499.75, 0.00, 0.00, 2999.50, '2025-05-23 02:20:05.545361+00', '2025-05-23 02:20:05.545361+00');
INSERT INTO public.sales_quote_items VALUES (8, 4, 'Custom Development', 'Custom software development (hourly)', 5, 150.00, 0.00, 0.00, 750.00, '2025-05-23 02:20:05.561196+00', '2025-05-23 02:20:05.561196+00');
INSERT INTO public.sales_quote_items VALUES (9, 4, 'Cloud Security Package', 'Advanced security suite', 4, 899.50, 0.00, 0.00, 3598.00, '2025-05-23 02:20:05.576626+00', '2025-05-23 02:20:05.576626+00');
INSERT INTO public.sales_quote_items VALUES (10, 5, 'Data Analytics Platform', 'Business intelligence tools', 5, 1499.75, 0.00, 0.00, 7498.75, '2025-05-23 02:20:05.592399+00', '2025-05-23 02:20:05.592399+00');
INSERT INTO public.sales_quote_items VALUES (11, 5, 'Custom Development', 'Custom software development (hourly)', 2, 150.00, 0.00, 0.00, 300.00, '2025-05-23 02:20:05.609084+00', '2025-05-23 02:20:05.609084+00');
INSERT INTO public.sales_quote_items VALUES (12, 5, 'Network Infrastructure', 'Network hardware and setup', 3, 2499.50, 0.00, 0.00, 7498.50, '2025-05-23 02:20:05.624837+00', '2025-05-23 02:20:05.624837+00');


--
-- Data for Name: sales_returns; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_returns VALUES (1, 'RET-2025-1001', NULL, NULL, 'TechNova Inc', '2025-05-13 02:20:08.463433+00', 'Completed', 1299.99, 'Product not needed anymore', NULL, NULL, '2025-05-23 02:20:08.463433+00', '2025-05-23 02:20:08.463433+00');
INSERT INTO public.sales_returns VALUES (2, 'RET-2025-1002', NULL, NULL, 'Elevate Solutions', '2025-05-16 02:20:08.463433+00', 'Processing', 899.50, 'Incompatible with current systems', NULL, NULL, '2025-05-23 02:20:08.463433+00', '2025-05-23 02:20:08.463433+00');
INSERT INTO public.sales_returns VALUES (3, 'RET-2025-1003', NULL, NULL, 'DataWave Analytics', '2025-05-18 02:20:08.463433+00', 'Approved', 699.99, 'Duplicate order', NULL, NULL, '2025-05-23 02:20:08.463433+00', '2025-05-23 02:20:08.463433+00');
INSERT INTO public.sales_returns VALUES (4, 'RET-2025-1004', NULL, NULL, 'Quantum Systems', '2025-05-20 02:20:08.463433+00', 'Pending', 1499.75, 'Wrong product received', NULL, NULL, '2025-05-23 02:20:08.463433+00', '2025-05-23 02:20:08.463433+00');


--
-- Data for Name: sales_return_items; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sales_return_items VALUES (1, 1, 'Data Analytics Platform', 2, 1499.75, 2999.50, NULL, 'New', '2025-05-23 02:20:08.524521+00', '2025-05-23 02:20:08.524521+00');
INSERT INTO public.sales_return_items VALUES (2, 1, 'Enterprise SaaS License', 1, 1299.99, 1299.99, NULL, 'Like New', '2025-05-23 02:20:08.541858+00', '2025-05-23 02:20:08.541858+00');
INSERT INTO public.sales_return_items VALUES (3, 2, 'Cloud Security Package', 2, 899.50, 1799.00, NULL, 'Damaged', '2025-05-23 02:20:08.557869+00', '2025-05-23 02:20:08.557869+00');
INSERT INTO public.sales_return_items VALUES (4, 3, 'Enterprise SaaS License', 2, 1299.99, 2599.98, NULL, 'Used', '2025-05-23 02:20:08.573484+00', '2025-05-23 02:20:08.573484+00');
INSERT INTO public.sales_return_items VALUES (5, 3, 'Network Infrastructure', 2, 2499.50, 4999.00, NULL, 'Used', '2025-05-