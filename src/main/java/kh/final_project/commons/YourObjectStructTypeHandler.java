package kh.final_project.commons;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

import kh.final_project.dto.CategoryType;
import oracle.jdbc.OracleConnection;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;

@MappedTypes(CategoryType.class)
@MappedJdbcTypes(JdbcType.STRUCT)
public class YourObjectStructTypeHandler extends BaseTypeHandler<List<CategoryType>> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, List<CategoryType> parameter, JdbcType jdbcType)
			throws SQLException {
		OracleConnection oracleConnection = ps.getConnection().unwrap(OracleConnection.class);
		StructDescriptor structDescriptor = StructDescriptor.createDescriptor("TYPE_OBJ", oracleConnection);

		List<STRUCT> structList = new ArrayList<>();
		for (CategoryType obj : parameter) {
			Object[] attributes = { obj.getCode(), obj.getSort(), obj.getName(), obj.getYn() };
			STRUCT struct = new STRUCT(structDescriptor, oracleConnection, attributes);
			structList.add(struct);
		}

		ArrayDescriptor arrayDescriptor = ArrayDescriptor.createDescriptor("TYPE_TABLE", oracleConnection);
		ARRAY array = new ARRAY(arrayDescriptor, oracleConnection, structList.toArray());

		ps.setArray(i, array);
	}

	@Override
	public List<CategoryType> getNullableResult(ResultSet rs, String columnName) throws SQLException {
		return null; // Not used
	}

	@Override
	public List<CategoryType> getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		return null; // Not used
	}

	@Override
	public List<CategoryType> getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		List<CategoryType> resultList = new ArrayList<>();
		ARRAY array = (ARRAY) cs.getArray(columnIndex);
		if (array != null) {
			Object[] structArray = (Object[]) array.getArray();
			for (Object structObj : structArray) {
				STRUCT struct = (STRUCT) structObj;
				Object[] attributes = struct.getAttributes();

				int property1 = ((Number) attributes[0]).intValue();
				int property2 = ((Number) attributes[1]).intValue();

				String property3 = (String) attributes[2];
				String property4 = (String) attributes[3];

				CategoryType obj = new CategoryType(property1, property2, property3, property4);
				System.out.println(obj);
				resultList.add(obj);
			}
		}
		return resultList;
	}
}