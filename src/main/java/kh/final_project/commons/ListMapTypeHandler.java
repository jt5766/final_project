package kh.final_project.commons;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;

public class ListMapTypeHandler implements TypeHandler<Object> {

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException {
		List<Map> objects = (List<Map>) parameter;

		StructDescriptor structDescriptor = new StructDescriptor("TYPE_OBJ", ps.getConnection());

		STRUCT[] structs = new STRUCT[objects.size()];

		for (int index = 0; index < objects.size(); index++) {
			Map map = objects.get(index);

			Object[] params = new Object[map.keySet().size()];
			Iterator<String> iterator = map.keySet().iterator();
			int keyIndex = 0;
			while (iterator.hasNext()) {
				String key = (String) iterator.next();
				params[keyIndex] = map.get(key);
				keyIndex++;
			}

			STRUCT struct = new STRUCT(structDescriptor, ps.getConnection(), params);
			structs[index] = struct;
		}

		ArrayDescriptor desc = ArrayDescriptor.createDescriptor("TYPE_LIST", ps.getConnection());
		Array array = new ARRAY(desc, ps.getConnection(), structs);
		ps.setArray(i, array);
	}

	@Override
	public Object getResult(ResultSet rs, String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		if (cs.wasNull())
			return null;
		else
			return cs.getString(columnIndex);
	}

}
