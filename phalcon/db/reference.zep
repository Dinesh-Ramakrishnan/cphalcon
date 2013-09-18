
/*
 +------------------------------------------------------------------------+
 | Phalcon Framework                                                      |
 +------------------------------------------------------------------------+
 | Copyright (c) 2011-2013 Phalcon Team (http://www.phalconphp.com)       |
 +------------------------------------------------------------------------+
 | This source file is subject to the New BSD License that is bundled     |
 | with this package in the file docs/LICENSE.txt.                        |
 |                                                                        |
 | If you did not receive a copy of the license and are unable to         |
 | obtain it through the world-wide-web, please send an email             |
 | to license@phalconphp.com so we can send you a copy immediately.       |
 +------------------------------------------------------------------------+
 | Authors: Andres Gutierrez <andres@phalconphp.com>                      |
 |          Eduar Carvajal <eduar@phalconphp.com>                         |
 +------------------------------------------------------------------------+
 */

namespace Phalcon\Db;

/**
 * Phalcon\Db\Reference
 *
 * Allows to define reference constraints on tables
 *
 *<code>
 *	$reference = new Phalcon\Db\Reference("field_fk", array(
 *		'referencedSchema' => "invoicing",
 *		'referencedTable' => "products",
 *		'columns' => array("product_type", "product_code"),
 *		'referencedColumns' => array("type", "code")
 *	));
 *</code>
 */
class Reference implements Phalcon\Db\ReferenceInterface
{

	protected _schemaName;

	protected _referencedSchema;

	/**
	 * Constraint name
	 *
	 * @var string
	 */
	protected _referenceName;

	/**
	 * Referenced Table
	 *
	 * @var string
	 */
	protected _referencedTable;

	/**
	 * Local reference columns
	 *
	 * @var array
	 */
	protected _columns;

	/**
	 * Referenced Columns
	 *
	 * @var array
	 */
	protected _referencedColumns;

	/**
	 * Phalcon\Db\Reference constructor
	 *
	 * @param string referenceName
	 * @param array definition
	 */
	public function __construct(referenceName, definition)
	{
		var columns, schema, referencedTable,
			referencedSchema, referencedColumns;

		let this->_referenceName = referenceName;

		if fetch referencedTable, definition["referencedTable"] {
			let this->_referencedTable = referencedTable;
		} else {
			throw new Phalcon\Db\Exception("Referenced table is required");
		}

		if fetch columns, definition["columns"] {
			let this->_columns = columns;
		} else {
			throw new Phalcon\Db\Exception("Foreign key columns are required");
		}

		if fetch referencedColumns, definition["referencedColumns"] {
			let this->_referencedColumns = referencedColumns;
		} else {
			throw new Phalcon\Db\Exception("Referenced columns of the foreign key are required");
		}

		if fetch schema, definition["schema"] {
			let this->_schemaName = schema;
		}

		if fetch referencedSchema, definition["referencedSchema"] {
			let this->_referencedSchema = referencedSchema;
		}

		if count(columns) != count(referencedColumns) {
			throw new Phalcon\Db\Exception("Number of columns is not equals than the number of columns referenced");
		}
	}

	/**
	 * Gets the index name
	 *
	 * @return string
	 */
	public function getName()
	{
		return this->_referenceName;
	}

	/**
	 * Gets the schema where referenced table is
	 *
	 * @return string
	 */
	public function getSchemaName()
	{
		return this->_schemaName;
	}

	/**
	 * Gets the schema where referenced table is
	 *
	 * @return string
	 */
	public function getReferencedSchema()
	{
		return this->_referencedSchema;
	}

	/**
	 * Gets local columns which reference is based
	 *
	 * @return array
	 */
	public function getColumns()
	{
		return this->_columns;
	}

	/**
	 * Gets the referenced table
	 *
	 * @return string
	 */
	public function getReferencedTable()
	{
		return this->_referencedTable;
	}

	/**
	 * Gets referenced columns
	 *
	 * @return array
	 */
	public function getReferencedColumns()
	{
		return this->_referencedColumns;
	}

	/**
	 * Restore a Phalcon\Db\Reference object from export
	 *
	 * @param array data
	 * @return Phalcon\Db\Reference
	 */
	public static function __set_state(data)
	{
		var referencedSchema, referencedTable, columns,
			referencedColumns, constraintName;

		if !fetch constraintName, data["_referenceName"] {
			throw new Phalcon\Db\Exception("_referenceName parameter is required");
		}

		//fetch referencedSchema, data["_referencedSchema"]
		//fetch referencedTable, data["_referencedTable"];
		//fetch columns, data["_columns"];
		//fetch referencedColumns, data["_referencedColumns"];

		/*return new Phalcon\Db\Reference(constraintName, [
			"referencedSchema"  : referencedSchema,
			"referencedTable"   : referencedTable,
			"columns"           : columns,
			"referencedColumns" : referencedColumns
		]);*/
	}

}
