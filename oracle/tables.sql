DEFINE owner=ks

@user


CREATE	TABLE &&owner..dict_flow_type
	(
	id		NUMBER NOT NULL,
	flow_type_name	VARCHAR2(200) NOT NULL,
PRIMARY	KEY (id),
UNIQUE	(flow_type_name)
)
ORGANIZATION INDEX
/

COMMENT	ON TABLE &&owner..dict_flow_type IS 'Incoming flow types'
/
COMMENT ON COLUMN &&owner..dict_flow_type.id IS 'Flow type ID - PK'
/
COMMENT ON COLUMN &&owner..dict_flow_type.flow_type_name IS 'Name of the flow'
/

CREATE	TABLE &&owner..dict_request_type
	(
	id		NUMBER NOT NULL,
	request_type_name	VARCHAR2(1000) NOT NULL,
PRIMARY	KEY (id),
UNIQUE	(request_type_name)
)
ORGANIZATION INDEX
/

COMMENT	ON TABLE &&owner..dict_request_type IS 'Types of the incoming requests'
/
COMMENT ON COLUMN &&owner..dict_request_type.id IS 'Request type ID - PK'
/
COMMENT ON COLUMN &&owner..dict_request_type.request_type_name IS 'Name of the request type'
/

CREATE	TABLE &&owner..dict_operation
	(
	id		NUMBER NOT NULL,
	interface_name	VARCHAR2(200) NOT NULL,
PRIMARY	KEY (id),
UNIQUE (interface_name)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..dict_operation IS 'List of ESB external interfaces'
/
COMMENT ON COLUMN &&owner..dict_operation.id IS 'Interface ID - PK'
/
COMMENT ON COLUMN &&owner..dict_operation.interface_name IS 'Interface name'
/

CREATE	TABLE &&owner..conf_version
	(
	id		NUMBER NOT NULL,
	entry_date	DATE DEFAULT SYSDATE NOT NULL,
PRIMARY KEY (id)
)
ORGANIZATION INDEX
/
COMMENT ON TABLE &&owner..conf_version IS 'Version history, should be used for every feature and action'
/
COMMENT ON COLUMN &&owner..conf_version.id IS 'Version ID - PK'
/
COMMENT ON COLUMN &&owner..conf_version.entry_date IS 'Version creation date'
/

CREATE	TABLE &&owner..dict_customer_type
	(
	id		NUMBER NOT NULL,
	type_name	VARCHAR2(500) NOT NULL,
PRIMARY KEY (id),
UNIQUE (type_name)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..dict_customer_type IS 'List of possible customer types, e.g. plain subscriber, account, etc.'
/
COMMENT ON COLUMN &&owner..dict_customer_type.id IS 'Customer type ID - PK'
/
COMMENT ON COLUMN &&owner..dict_customer_type.type_name IS 'Name of the type'
/

CREATE	TABLE &&owner..dict_error_type
	(
	id		NUMBER NOT NULL,
	type_name	VARCHAR2(500) NOT NULL,
PRIMARY KEY (id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..dict_error_type IS 'List of possible error types'
/
COMMENT ON COLUMN &&owner..dict_error_type.id IS 'Error type ID - PK'
/
COMMENT ON COLUMN &&owner..dict_error_type.type_name IS 'Name of the error type'
/

CREATE	TABLE &&owner..dict_language
	(
	id		NUMBER NOT NULL,
	language_name	VARCHAR2(100) NOT NULL,
PRIMARY KEY (id),
UNIQUE (language_name)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..dict_language IS 'List of languages to be used by the system'
/
COMMENT ON COLUMN &&owner..dict_language.id IS 'Language ID - PK'
/
COMMENT ON COLUMN &&owner..dict_language.language_name IS 'Language name'
/

CREATE TABLE &&owner..conf_source
	(
	id		NUMBER NOT NULL,
	source_name	VARCHAR2(100) NOT NULL,
	version_id	NUMBER NOT NULL,
PRIMARY KEY (id),
UNIQUE (source_name),
FOREIGN KEY (version_id) REFERENCES &&owner..conf_version(id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..conf_source IS 'List of sources, i.e. external systems allowed to send orders to ESB'
/
COMMENT ON COLUMN &&owner..conf_source.id IS 'Source ID - PK'
/
COMMENT ON COLUMN &&owner..conf_source.source_name IS 'Source name'
/
COMMENT ON COLUMN &&owner..conf_source.version_id IS 'Version ID, FK to CONF_VERSION'
/

CREATE TABLE &&owner..conf_handler
	(
	id		NUMBER NOT NULL,
	handler_name	VARCHAR2(100) NOT NULL,
	version_id	NUMBER NOT NULL,
PRIMARY KEY (id),
UNIQUE (handler_name),
FOREIGN KEY (version_id) REFERENCES &&owner..conf_version(id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..conf_handler IS 'List of handlers, i.e. external systems ESB will send orders to for processing'
/
COMMENT ON COLUMN &&owner..conf_handler.id IS 'Handler ID - PK'
/
COMMENT ON COLUMN &&owner..conf_handler.handler_name IS 'Handler name'
/
COMMENT ON COLUMN &&owner..conf_handler.version_id IS 'Version ID, FK to CONF_VERSION'
/

CREATE TABLE &&owner..dict_action_type
	(
	id		NUMBER NOT NULL,
	action_name	VARCHAR2(1000) NOT NULL,
	action_desc	VARCHAR2(1000),
PRIMARY KEY (id),
UNIQUE (action_name)
)
ORGANIZATION INDEX
/
COMMENT ON TABLE &&owner..dict_action_type IS 'Directory of possible action types, e.g. activation, deactivation, etc.'
/
COMMENT ON COLUMN &&owner..dict_action_type.id IS 'Action type ID - PK'
/
COMMENT ON COLUMN &&owner..dict_action_type.action_name IS 'Action name'
/
COMMENT ON COLUMN &&owner..dict_action_type.action_desc IS 'Action description'
/

CREATE	TABLE &&owner..dict_order_status
	(
	id		NUMBER NOT NULL,
	status_name	VARCHAR2(30) NOT NULL,
	status_desc	VARCHAR2(1000) NOT NULL,
PRIMARY KEY (id),
UNIQUE (status_name)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..dict_order_status IS 'Directory of possible order statuses'
/
COMMENT ON COLUMN &&owner..dict_order_status.id IS 'Order status ID - PK'
/
COMMENT	ON COLUMN &&owner..dict_order_status.status_name IS 'Unique name of the status'
/
COMMENT ON COLUMN &&owner..dict_order_status.status_desc IS 'Order status description'
/

CREATE TABLE &&owner..dict_error
	(
	id		NUMBER NOT NULL,
	error_type_id	NUMBER NOT NULL,
	error_desc	VARCHAR2(1000) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (error_type_id) REFERENCES &&owner..dict_error_type(id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..dict_error IS 'Directory of possible errors during execution of an order'
/
COMMENT ON COLUMN &&owner..dict_error.id IS 'Error ID - PK'
/
COMMENT ON COLUMN &&owner..dict_error.error_desc IS 'Description of the error'
/
COMMENT ON COLUMN &&owner..dict_error.error_type_id IS 'Type of the error, FK to DICT_ERROR_TYPE'
/

CREATE	TABLE &&owner..conf_activation_term
	(
	id		NUMBER NOT NULL,
	term_des	VARCHAR2(500) NOT NULL,
	version_id	NUMBER NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (version_id) REFERENCES &&owner..conf_version(id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..conf_activation_term IS 'Service activation periods'
/
COMMENT ON COLUMN &&owner..conf_activation_term.id IS 'Activation term ID - PK'
/
COMMENT ON COLUMN &&owner..conf_activation_term.term_des IS 'Description'
/
COMMENT ON COLUMN &&owner..conf_activation_term.version_id IS 'Version ID, FK to CONF_VERSION'
/

CREATE	TABLE &&owner..conf_billing_term
	(
	id		NUMBER NOT NULL,
	term_des	VARCHAR2(500) NOT NULL,
	version_id	NUMBER NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (version_id) REFERENCES &&owner..conf_version(id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..conf_billing_term IS 'Service billing periods'
/
COMMENT ON COLUMN &&owner..conf_billing_term.id IS 'Billing term ID - PK'
/
COMMENT ON COLUMN &&owner..conf_billing_term.term_des IS 'Description'
/
COMMENT ON COLUMN &&owner..conf_billing_term.version_id IS 'Version ID, FK to CONF_VERSION'
/

CREATE	TABLE &&owner..conf_charge_term
	(
	id		NUMBER NOT NULL,
	billing_term_id	NUMBER NOT NULL,
	charge_value_id	NUMBER NOT NULL,
	charge_amt	NUMBER NOT NULL,
	charge_term_desc	VARCHAR2(1000),
PRIMARY	KEY (id),
FOREIGN	KEY (billing_term_id) REFERENCES &&owner..conf_billing_term (id)
)
/

COMMENT	ON TABLE &&owner..conf_charge_term IS 'Charging terms'
/
COMMENT	ON COLUMN &&owner..conf_charge_term.id IS 'Charging term ID - PK'
/
COMMENT	ON COLUMN &&owner..conf_charge_term.billing_term_id IS 'Billing term, FK to DICT_BILLING_TERM'
/
COMMENT ON COLUMN &&owner..conf_charge_term.charge_amt IS 'Charged amount'
/
COMMENT	ON COLUMN &&owner..conf_charge_term.charge_term_desc IS 'Charging term description'
/

CREATE	TABLE &&owner..dict_subscriber_segment
	(
	id	NUMBER NOT NULL,
	segment_name	VARCHAR2(1000),
PRIMARY KEY (id),
UNIQUE (segment_name)
)
ORGANIZATION INDEX
/
COMMENT ON TABLE &&owner..dict_subscriber_segment IS 'Customer segments'
/
COMMENT ON COLUMN &&owner..dict_subscriber_segment.id IS 'Customer segment ID - PK'
/
COMMENT ON COLUMN &&owner..dict_subscriber_segment.segment_name IS 'Name of the segment'
/

CREATE	TABLE &&owner..dict_feature_type
	(
	id		NUMBER NOT NULL,
	type_name	VARCHAR2(600) NOT NULL,
PRIMARY KEY (id),
UNIQUE (type_name)
)
ORGANIZATION INDEX
/
COMMENT ON TABLE &&owner..dict_feature_type IS 'Feature types, should be assigned to each feature'
/
COMMENT ON COLUMN &&owner..dict_feature_type.id IS 'Feature ID - PK'
/
COMMENT ON COLUMN &&owner..dict_feature_type.type_name IS 'Name of the feature type'
/ 

CREATE	TABLE &&owner..conf_feature
	(
	id		NUMBER NOT NULL,
	feature_type_id	NUMBER NOT NULL,
	target_type_id	NUMBER NOT NULL,
	origin_type_id	NUMBER NOT NULL,
	act_term_id	NUMBER NOT NULL,
	billing_term_id	NUMBER NOT NULL,
	version_id	NUMBER NOT NULL,
	start_date	DATE NOT NULL,
	end_date	DATE NOT NULL,
	curr_version	VARCHAR2(1) DEFAULT 'X',
PRIMARY KEY (id, version_id),
FOREIGN KEY (feature_type_id) REFERENCES &&owner..dict_feature_type(id),
FOREIGN KEY (target_type_id) REFERENCES &&owner..dict_customer_type(id),
FOREIGN KEY (origin_type_id) REFERENCES &&owner..dict_customer_type(id),
FOREIGN KEY (act_term_id) REFERENCES &&owner..conf_activation_term(id),
FOREIGN KEY (billing_term_id) REFERENCES &&owner..conf_billing_term(id),
FOREIGN KEY (version_id) REFERENCES &&owner..conf_version(id)
)
/
COMMENT ON TABLE &&owner..conf_feature IS 'Main directory of all features to be provided by the system (including rateplans)'
/
COMMENT ON COLUMN &&owner..conf_feature.id IS 'Feature ID - PK'
/
COMMENT ON COLUMN &&owner..conf_feature.feature_type_id IS 'Service type ID, FK to DICT_FEATURE_TYPE'
/
COMMENT ON COLUMN &&owner..conf_feature.target_type_id IS 'Target type ID, FK to DICT_CUSTOMER_TYPE'
/
COMMENT ON COLUMN &&owner..conf_feature.origin_type_id IS 'Originator type ID, FK to DICT_CUSTOMER_TYPE'
/
COMMENT ON COLUMN &&owner..conf_feature.act_term_id IS 'Activation term, FK to CONF_ACTIVATION_TERM'
/
COMMENT ON COLUMN &&owner..conf_feature.billing_term_id IS 'Billing term, FK to CONF_BILLING_TERM'
/
COMMENT ON COLUMN &&owner..conf_feature.version_id IS 'Version, FK to CONF_VERSION'
/
COMMENT ON COLUMN &&owner..conf_feature.start_date IS 'Availability date'
/
COMMENT ON COLUMN &&owner..conf_feature.end_date IS 'Closure date'
/
COMMENT ON COLUMN &&owner..conf_feature.curr_version IS 'Flag for the current version, X - the version is current'
/

CREATE TABLE &&owner..conf_handler_feature
	(
	id		NUMBER NOT NULL,
	handler_id	NUMBER NOT NULL,
	feature_id	NUMBER NOT NULL,
PRIMARY KEY (id),
--FOREIGN KEY (feature_id) REFERENCES &&owner..conf_feature(id),
FOREIGN KEY (handler_id) REFERENCES &&owner..conf_handler(id)
)
/
COMMENT ON TABLE &&owner..conf_handler_feature IS 'Mapping between features and handlers'
/
COMMENT ON COLUMN &&owner..conf_handler_feature.id IS 'Mapping ID - primary key'
/
COMMENT ON COLUMN &&owner..conf_handler_feature.handler_id IS 'Handler ID - FK to CONF_HANDLER'
/
COMMENT ON COLUMN &&owner..conf_handler_feature.feature_id IS 'Feature, previously SELF_VALUE'
/

CREATE	TABLE &&owner..conf_feature_billing_map
	(
	feature_id	NUMBER NOT NULL,
	billing_term_id	NUMBER NOT NULL,
PRIMARY	KEY (feature_id, billing_term_id),
--FOREIGN	KEY (feature_id) REFERENCES &&owner..conf_feature (id),
FOREIGN	KEY (billing_term_id) REFERENCES &&owner..conf_billing_term (id)
)
ORGANIZATION INDEX
/

COMMENT	ON TABLE &&owner..conf_feature_billing_map IS 'Mapping between features and allowed billing terms'
/

CREATE	TABLE &&owner..conf_handler_feature_map
	(
	feature_id	NUMBER NOT NULL,
	handler_ftr_id	NUMBER NOT NULL,
PRIMARY KEY (feature_id, handler_ftr_id),
--FOREIGN KEY (feature_id) REFERENCES &&owner..conf_feature(id),
FOREIGN KEY (handler_ftr_id) REFERENCES &&owner..conf_handler_feature(id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..conf_handler_feature_map IS 'Mapping between ESB and handler features'
/
COMMENT ON COLUMN &&owner..conf_handler_feature_map.feature_id IS 'ESB feature ID, part of PK, FK to CONF_FEATURE'
/
COMMENT ON COLUMN &&owner..conf_handler_feature_map.handler_ftr_id IS 'Handler feature ID, part of PK, FK to CONF_HANDLER_FEATURE'
/

CREATE	TABLE &&owner..conf_handler_action
	(
	id		NUMBER NOT NULL,
	handler_id	NUMBER NOT NULL,
	external_id	NUMBER NOT NULL,
	command_desc	VARCHAR2(1000) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (handler_id) REFERENCES &&owner..conf_handler(id),
UNIQUE (handler_id, external_id)
)
/
COMMENT ON TABLE &&owner..conf_handler_action IS 'List of external handler commands (actions), each ESB command should call according command on the handler side'
/
COMMENT ON COLUMN &&owner..conf_handler_action.id IS 'Action ID - PK'
/
COMMENT ON COLUMN &&owner..conf_handler_action.handler_id IS 'Handler ID - FK to CONF_HANDLER'
/
COMMENT ON COLUMN &&owner..conf_handler_action.external_id IS 'External command to be called'
/
COMMENT ON COLUMN &&owner..conf_handler_action.command_desc IS 'Description of the command'
/

CREATE	TABLE &&owner..conf_action
	(
	id		NUMBER NOT NULL,
	feature_id	NUMBER NOT NULL,
	action_type_id	NUMBER NOT NULL,
	target_type_id	NUMBER NOT NULL, -- Not really clear why it is needed
	origin_type_id	NUMBER NOT NULL, -- Not really clear why it is needed
	active		VARCHAR2(1) DEFAULT 'N' NOT NULL,
	start_date	DATE NOT NULL,
	end_date	DATE NOT NULL,
	version_id	NUMBER NOT NULL,
	price		NUMBER,
PRIMARY KEY (id, version_id),
FOREIGN KEY (feature_id, version_id) REFERENCES &&owner..conf_feature(id, version_id),
FOREIGN KEY (action_type_id) REFERENCES &&owner..dict_action_type(id),
FOREIGN KEY (version_id) REFERENCES &&owner..conf_version(id),
FOREIGN KEY (target_type_id) REFERENCES &&owner..dict_customer_type(id),
FOREIGN KEY (origin_type_id) REFERENCES &&owner..dict_customer_type(id),
UNIQUE (feature_id, action_type_id),
CHECK (active IN ('Y', 'N'))
)
/

COMMENT ON TABLE &&owner..conf_action IS 'Directory of possible actions. Matrix formed by CONF_FEATURE, DICT_ACTION_TYPE and DICT_SUBSCRIBER_SEGMENT tables'
/
COMMENT ON COLUMN &&owner..conf_action.feature_id IS 'Service ID, FK to CONF_FEATURE'
/
COMMENT ON COLUMN &&owner..conf_action.action_type_id IS 'Action ID, FK to DICT_ACTION_TYPE'
/
COMMENT ON COLUMN &&owner..conf_action.target_type_id IS 'Target type ID - FK to DICT_CUSTOMER_TYPE'
/
COMMENT ON COLUMN &&owner..conf_action.origin_type_id IS 'Originator type ID - FK to DICT_CUSTOMER_TYPE'
/
COMMENT ON COLUMN &&owner..conf_action.active IS 'Flag if action is active, Y - active, N - not active'
/
COMMENT ON COLUMN &&owner..conf_action.start_date IS 'Availability date'
/
COMMENT ON COLUMN &&owner..conf_action.end_date IS 'Closure date'
/
COMMENT ON COLUMN &&owner..conf_action.version_id IS 'Action version ID'
/
COMMENT ON COLUMN &&owner..conf_action.price IS 'Amount charged to customer'
/

CREATE	TABLE &&owner..conf_handler_action_map
	(
	action_id	NUMBER NOT NULL,
	handler_cmd_id	NUMBER NOT NULL,
PRIMARY KEY (action_id, handler_cmd_id),
--FOREIGN KEY (action_id) REFERENCES &&owner..conf_action(id),
FOREIGN KEY (handler_cmd_id) REFERENCES &&owner..conf_handler_action(id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..conf_handler_action_map IS 'Mapping between ESB and handler commands'
/
COMMENT ON COLUMN &&owner..conf_handler_action_map.action_id IS 'ESB action ID, part of PK, FK to CONF_ACTION'
/
COMMENT ON COLUMN &&owner..conf_handler_action_map.handler_cmd_id IS 'Handler command ID, part of PK, FK to CONF_HANDLER_ACTION'
/

CREATE TABLE &&owner..conf_action_parameter
	(
	action_type_id	NUMBER NOT NULL,
	parameter_name	VARCHAR2(1000) NOT NULL,
	parameter_no	NUMBER NOT NULL,
	parameter_desc	VARCHAR2(1000) NOT NULL,
	version_id	NUMBER NOT NULL,
PRIMARY KEY (action_type_id, parameter_name, parameter_no, version_id),
FOREIGN KEY (action_type_id) REFERENCES &&owner..dict_action_type(id),
FOREIGN	KEY (version_id) REFERENCES &&owner..conf_version(id)
)
ORGANIZATION INDEX
/
COMMENT ON TABLE &&owner..conf_action_parameter IS 'List of parameters for each action type'
/
COMMENT ON COLUMN &&owner..conf_action_parameter.action_type_id IS 'Action type ID, part of PK, FK to DICT_ACTION_TYPE'
/
COMMENT ON COLUMN &&owner..conf_action_parameter.parameter_no IS 'Parameter name, part of PK'
/
COMMENT ON COLUMN &&owner..conf_action_parameter.parameter_no IS 'Parameter number, part of PK'
/
COMMENT ON COLUMN &&owner..conf_action_parameter.parameter_desc IS 'Parameter description'
/
COMMENT ON COLUMN &&owner..conf_action_parameter.version_id IS 'Version ID, FK to CONF_VERSION'
/

CREATE	TABLE &&owner..conf_feature_relation
	(
	id			NUMBER NOT NULL,
	requested_feature_id	NUMBER NOT NULL,
	dependent_feature_id	NUMBER NOT NULL,
	dependency_type		VARCHAR2(1) NOT NULL,
	version_id		NUMBER NOT NULL,
	is_active		VARCHAR2(1) DEFAULT 'X',
PRIMARY KEY (id, version_id),
FOREIGN KEY (requested_feature_id, version_id) REFERENCES &&owner..conf_feature(id, version_id),
FOREIGN KEY (dependent_feature_id, version_id) REFERENCES &&owner..conf_feature(id, version_id),
CHECK (dependency_type IN ('M', 'F')),
FOREIGN KEY (version_id) REFERENCES &&owner..conf_version(id)
)
/

COMMENT ON TABLE &&owner..conf_feature_relation IS 'List dependencies for each feature - mandatory and forbidden features'
/
COMMENT ON COLUMN &&owner..conf_feature_relation.id IS 'Dependency ID - PK'
/
COMMENT ON COLUMN &&owner..conf_feature_relation.requested_feature_id IS 'ID of the feature requested by an order. FK to CONF_FEATURE'
/
COMMENT ON COLUMN &&owner..conf_feature_relation.dependent_feature_id IS 'ID of the dependent feature, FK to CONF_FEATURE'
/
COMMENT ON COLUMN &&owner..conf_feature_relation.dependency_type IS 'Dependency type: M - mandatory, F - forbidden'
/
COMMENT ON COLUMN &&owner..conf_feature_relation.is_active IS 'Flag if dependency is active, X - yes)'
/
COMMENT ON COLUMN &&owner..conf_feature_relation.version_id IS 'Version ID, FK to CONF_VERSION'
/

CREATE TABLE &&owner..conf_feature_hierarchy
	(
	parent_feature_id	NUMBER NOT NULL,
	child_feature_id	NUMBER NOT NULL,
	version_id		NUMBER NOT NULL,
PRIMARY KEY (parent_feature_id, child_feature_id, version_id),
FOREIGN KEY (parent_feature_id, version_id) REFERENCES &&owner..conf_feature(id, version_id),
FOREIGN KEY (child_feature_id, version_id) REFERENCES &&owner..conf_feature(id, version_id)
)
ORGANIZATION INDEX
/
COMMENT ON TABLE &&owner..conf_feature_hierarchy IS 'Service hierarchy'
/
COMMENT ON COLUMN &&owner..conf_feature_hierarchy.parent_feature_id IS 'Parent feature ID, FK to CONF_FEATURE'
/
COMMENT ON COLUMN &&owner..conf_feature_hierarchy.child_feature_id IS 'Child feature ID, FK to CONF_FEATURE'
/
COMMENT ON COLUMN &&owner..conf_feature_hierarchy.version_id IS 'Version ID, FK to CONF_VERSION'
/

-- Working tables
CREATE	TABLE &&owner..data_order
	(
	id		NUMBER NOT NULL, 
	target_id	VARCHAR2(200) NOT NULL,
	originator_id	VARCHAR2(200) NOT NULL,
	source_id	NUMBER NOT NULL,
	action_id	NUMBER NOT NULL,
	billing_term_id	NUMBER NOT NULL,
	last_handler_id	NUMBER NOT NULL,
	priority	NUMBER NOT NULL,
	entry_date	DATE DEFAULT SYSDATE NOT NULL,
	fetch_date	DATE NOT NULL,
	status_id	NUMBER NOT NULL,
	source_order_id	NUMBER,
	group_id	NUMBER,
	group_seqno	NUMBER DEFAULT 1 NOT NULL,
	error_id	NUMBER,
	execution_date	DATE,
PRIMARY KEY (id),
FOREIGN KEY (source_id) REFERENCES &&owner..conf_source(id),
FOREIGN KEY (last_handler_id) REFERENCES &&owner..conf_handler(id),
--FOREIGN KEY (action_id) REFERENCES &&owner..conf_action(id),
FOREIGN KEY (status_id) REFERENCES &&owner..dict_order_status(id),
FOREIGN KEY (error_id) REFERENCES &&owner..dict_error,
FOREIGN	KEY (billing_term_id) REFERENCES &&owner..conf_billing_term (id)
)
/
COMMENT ON TABLE &&owner..data_order IS 'All ESB orders'
/
COMMENT ON COLUMN &&owner..data_order.id IS 'Order ID - PK'
/
COMMENT ON COLUMN &&owner..data_order.target_id IS 'Target ID, e.g. phone number or OKPO of the customer the action is executed for'
/
COMMENT ON COLUMN &&owner..data_order.originator_id IS 'Originator ID, e.g. phone number or OKPO of the customer who requested the action'
/
COMMENT ON COLUMN &&owner..data_order.source_id IS 'Source ID - FK to CONF_SOURCE'
/
COMMENT ON COLUMN &&owner..data_order.action_id IS 'Command ID - FK to CONF_ACTION'
/
COMMENT	ON COLUMN &&owner..data_order.billing_term_id IS 'Billing term ID - FK to CONF_BILLING_TERM'
/
COMMENT ON COLUMN &&owner..data_order.last_handler_id IS 'ID of the last invoked handler - FK to CONF_HANDLER'
/
COMMENT ON COLUMN &&owner..data_order.priority IS 'Command priority'
/
COMMENT ON COLUMN &&owner..data_order.entry_date IS 'Date when the order was entered into the system'
/
COMMENT ON COLUMN &&owner..data_order.fetch_date IS 'Date when the order should be executed'
/
COMMENT ON COLUMN &&owner..data_order.status_id IS 'Current order status - FK to DICT_ORDER_STATUS'
/
COMMENT ON COLUMN &&owner..data_order.group_id IS 'Group ID for packaged orders'
/
COMMENT ON COLUMN &&owner..data_order.group_seqno IS 'Sequence number of the order in the group'
/
COMMENT ON COLUMN &&owner..data_order.error_id IS 'Error ID - FK to DICT_ORDER_ERROR'
/
COMMENT ON COLUMN &&owner..data_order.execution_date IS 'Date when the order was executed'
/
COMMENT ON COLUMN &&owner..data_order.source_order_id IS 'ID of the order at the source'
/

CREATE	INDEX &&owner..data_order_source_order_id
ON	&&owner..data_order(source_order_id)
/

CREATE TABLE &&owner..data_order_parameter
	(
	order_id	NUMBER NOT NULL,
	parameter_no	NUMBER NOT NULL,
	parameter_value	VARCHAR2(4000),
PRIMARY KEY (order_id, parameter_no),
FOREIGN KEY (order_id) REFERENCES &&owner..data_order(id)
)
/

COMMENT ON TABLE &&owner..data_order_parameter IS 'Order (request) parameters, according to CONF_ACTION_PARAMETER table'
/
COMMENT ON COLUMN &&owner..data_order_parameter.order_id IS 'Order ID, part of PK, FK to DATA_ORDER'
/
COMMENT ON COLUMN &&owner..data_order_parameter.parameter_no IS 'Parameter number, part of PK'
/
COMMENT ON COLUMN &&owner..data_order_parameter.parameter_value IS 'Value of the parameter'
/

-- Archive tables
CREATE	TABLE &&owner..data_order_archive
	(
	id		NUMBER NOT NULL, 
	target_id	VARCHAR2(200) NOT NULL,
	originator_id	VARCHAR2(200) NOT NULL,
	source_id	NUMBER NOT NULL,
	action_id	NUMBER NOT NULL,
	last_handler_id	NUMBER NOT NULL,
	priority	NUMBER NOT NULL,
	entry_date	DATE DEFAULT SYSDATE NOT NULL,
	fetch_date	DATE NOT NULL,
	status_id	NUMBER NOT NULL,
	package_id	NUMBER,
	error_id	NUMBER,
	execution_date	DATE,
PRIMARY KEY (id),
FOREIGN KEY (source_id) REFERENCES &&owner..conf_source(id),
FOREIGN KEY (last_handler_id) REFERENCES &&owner..conf_handler(id),
--FOREIGN KEY (action_id) REFERENCES &&owner..conf_action(id),
FOREIGN KEY (status_id) REFERENCES &&owner..dict_order_status(id),
FOREIGN KEY (error_id) REFERENCES &&owner..dict_error
)
/
COMMENT ON TABLE &&owner..data_order_archive IS 'Fully processed ESB orders that can be moved to readonly state'
/
COMMENT ON COLUMN &&owner..data_order_archive.id IS 'Order ID - PK'
/
COMMENT ON COLUMN &&owner..data_order_archive.target_id IS 'Target ID, e.g. phone number or OKPO of the customer the action is executed for'
/
COMMENT ON COLUMN &&owner..data_order_archive.originator_id IS 'Originator ID, e.g. phone number or OKPO of the customer who requested the action'
/
COMMENT ON COLUMN &&owner..data_order_archive.source_id IS 'Source ID - FK to CONF_SOURCE'
/
COMMENT ON COLUMN &&owner..data_order_archive.action_id IS 'Command ID - FK to CONF_ACTION'
/
COMMENT ON COLUMN &&owner..data_order_archive.last_handler_id IS 'ID of the last invoked handler - FK to CONF_HANDLER'
/
COMMENT ON COLUMN &&owner..data_order_archive.priority IS 'Command priority'
/
COMMENT ON COLUMN &&owner..data_order_archive.entry_date IS 'Date when the order was entered into the system'
/
COMMENT ON COLUMN &&owner..data_order_archive.fetch_date IS 'Date when the order should be executed'
/
COMMENT ON COLUMN &&owner..data_order_archive.status_id IS 'Current order status - FK to DICT_ORDER_STATUS'
/
COMMENT ON COLUMN &&owner..data_order_archive.package_id IS 'Package ID for packaged orders'
/
COMMENT ON COLUMN &&owner..data_order_archive.error_id IS 'Error ID - FK to DICT_ORDER_ERROR'
/
COMMENT ON COLUMN &&owner..data_order_archive.execution_date IS 'Date when the order was executed'
/

CREATE TABLE &&owner..data_order_archive_parameter
	(
	order_id	NUMBER NOT NULL,
	parameter_no	NUMBER NOT NULL,
	parameter_value	VARCHAR2(4000),
PRIMARY KEY (order_id, parameter_no),
FOREIGN KEY (order_id) REFERENCES &&owner..data_order_archive(id)
)
/

COMMENT ON TABLE &&owner..data_order_archive_parameter IS 'Parameters of fully processed ESB orders that can be moved to readonly state'
/
COMMENT ON COLUMN &&owner..data_order_archive_parameter.order_id IS 'Order ID, part of PK, FK to DATA_ORDER'
/
COMMENT ON COLUMN &&owner..data_order_archive_parameter.parameter_no IS 'Parameter number, part of PK'
/
COMMENT ON COLUMN &&owner..data_order_archive_parameter.parameter_value IS 'Value of the parameter'
/

-- Tables for locking mechanism
CREATE	TABLE &&owner..conf_lock
	(
	id		NUMBER NOT NULL,
	lock_type_name	VARCHAR2(200) NOT NULL,
	target_type_id	NUMBER NOT NULL,
	origin_type_id	NUMBER NOT NULL,
PRIMARY	KEY (id),
UNIQUE (lock_type_name, target_type_id, origin_type_id),
FOREIGN KEY (target_type_id) REFERENCES &&owner..dict_customer_type,
FOREIGN KEY (origin_type_id) REFERENCES &&owner..dict_customer_type
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..conf_lock IS 'Configurable list of possible locks'
/
COMMENT ON COLUMN &&owner..conf_lock.id IS 'Lock type ID - PK'
/
COMMENT ON COLUMN &&owner..conf_lock.lock_type_name IS 'Lock type name/description'
/
COMMENT ON COLUMN &&owner..conf_lock.target_type_id IS 'Target type ID, FK to DICT_CUSTOMER_TYPE'
/
COMMENT ON COLUMN &&owner..conf_lock.origin_type_id IS 'Originator type ID, FK to DICT_CUSTOMER_TYPE'
/

CREATE	TABLE &&owner..conf_lock_parameter
	(
	lock_type_id	NUMBER NOT NULL,
	parameter_id	NUMBER NOT NULL,
	parameter_desc	VARCHAR2(200) NOT NULL,
PRIMARY	KEY (lock_type_id, parameter_id),
FOREIGN KEY (lock_type_id) REFERENCES &&owner..conf_lock(id)
)
ORGANIZATION INDEX
/

COMMENT ON TABLE &&owner..conf_lock_parameter IS 'Parameter of locks'
/
COMMENT ON COLUMN &&owner..conf_lock_parameter.lock_type_id IS 'Type of the lock, part of PK, FK to CONF_LOCK_TYPE'
/
COMMENT ON COLUMN &&owner..conf_lock_parameter.parameter_id IS 'Parameter ID, unique within a lock type, part of PK'
/
COMMENT ON COLUMN &&owner..conf_lock_parameter.parameter_desc IS 'Description of the parameter'
/

CREATE	TABLE &&owner..data_lock
	(
	id		NUMBER NOT NULL,
	lock_type_id	NUMBER NOT NULL,
	target_id	VARCHAR2(200) NOT NULL,
	originator_id	VARCHAR2(200) NOT NULL,
PRIMARY	KEY (id),
FOREIGN KEY (lock_type_id) REFERENCES &&owner..conf_lock(id)
)
/

COMMENT ON TABLE &&owner..data_lock IS 'Transactional table for locks'
/
COMMENT ON COLUMN &&owner..data_lock.id IS 'Lock ID, PK'
/
COMMENT ON COLUMN &&owner..data_lock.lock_type_id IS 'Type of the lock, FK to CONF_LOCK_TYPE'
/
COMMENT ON COLUMN &&owner..data_lock.target_id IS 'Target ID'
/
COMMENT ON COLUMN &&owner..data_lock.originator_id IS 'Originator ID'
/
