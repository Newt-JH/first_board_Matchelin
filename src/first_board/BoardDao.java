package first_board;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;


import common.JdbcUtil;

public class BoardDao {
	
	
	private JdbcUtil ju;
	public BoardDao() {
		ju = JdbcUtil.getInstance();
	}
	

	public int insert(BoardVO vo) {
	
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "insert into \"first_board\" (\"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"CATEGORY\") values (\"first_board_seq\".nextval, ?, ?, ?,sysdate,0,?,?)";
		int ret = -1;
		
		try {
			
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getImg());
			pstmt.setString(5, vo.getCategory());
			ret = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			
			if(pstmt != null) {
				try {
				pstmt.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
				con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return ret;
	}

	public List<BoardVO> selectAll(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" order by \"num\" desc";
		ArrayList<BoardVO> ls = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				new Date(rs.getDate(5).getTime()),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				ls.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return ls;
	}
	
	
	public List<BoardVO> selectImg(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where ROWNUM <= 9 and img is not null order by \"num\" desc";
		ArrayList<BoardVO> imgls = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				new Date(rs.getDate(5).getTime()),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				imgls.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
		return imgls;
	}
	
	public BoardVO selectOne(int num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where \"num\"=?";
		BoardVO vo = null;
		try {
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			updateCnt(num);
			rs = pstmt.executeQuery();
			if(rs.next()) {

				vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
				);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(pstmt != null) {
		try {
			pstmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
		return vo;
	}

	public int update(BoardVO vo) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String query = "update \"first_board\" set \"title\"=?, \"content\"=? where \"num\"=?";
	int ret = -1;
	
	try {
		
		con = ju.getConnection();
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, vo.getTitle());
		pstmt.setString(2, vo.getContent());
		pstmt.setInt(3, vo.getNum());
		ret = pstmt.executeUpdate();
		
	}catch(SQLException e) {
		e.printStackTrace();
	}finally{
		
		if(pstmt != null) {
			try {
			pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(con != null) {
			try {
			con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	return ret;
		
	}
	

	
	public int updateCnt(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update \"first_board\" set \"cnt\"=\"cnt\"+1 where \"num\"=?";
		int ret = -1;
		
		try {
			
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			ret = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			
			if(pstmt != null) {
				try {
				pstmt.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
				con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return ret;
			
		}
	

	
	public int delete(int num) {
	Connection con = null;
	PreparedStatement pstmt = null;
	String query = "delete from \"first_board\" where \"num\"=?";
	int ret = -1;
	
	try {
		
		con = ju.getConnection();
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, num);
		ret = pstmt.executeUpdate();
		
	}catch(SQLException e) {
		e.printStackTrace();
	}finally{
		
		if(pstmt != null) {
			try {
			pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(con != null) {
			try {
			con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	return ret;
		
	}
	
	
	
	
	
	
	
	
	
	public List<BoardVO> selectkor(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where \"CATEGORY\" like \'kor\' order by \"HEART\" desc";

		
		ArrayList<BoardVO> lskor = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lskor.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lskor;
	}
	
	
	public List<BoardVO> selectjap(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where \"CATEGORY\" like \'jap\' order by \"HEART\" desc";

		
		ArrayList<BoardVO> lsjap = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lsjap.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lsjap;
	}
	
	
	
	
	public List<BoardVO> selectchi(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where \"CATEGORY\" like \'chi\' order by \"HEART\" desc";

		
		ArrayList<BoardVO> lschi = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lschi.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lschi;
	}
	
	
	public List<BoardVO> selecteng(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where \"CATEGORY\" like \'eng\' order by \"HEART\" desc";

		
		ArrayList<BoardVO> lseng = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lseng.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lseng;
	}
	
	
	public List<BoardVO> selectcafe(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where \"CATEGORY\" like \'cafe\' order by \"HEART\" desc";

		
		ArrayList<BoardVO> lscafe = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lscafe.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lscafe;
	}
	
	
	
	
	public int plusHeart(int heart,int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String query = "update \"first_board\" set \"HEART\"=? where \"num\" =?";
		int ret = -1;
		
		try {
			
			con = ju.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, heart);
			pstmt.setInt(2, num);
			ret = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			
			if(pstmt != null) {
				try {
				pstmt.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(con != null) {
				try {
				con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return ret;
			
		}
	
	
	
	public List<BoardVO> selectbestkor(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where ROWNUM <= 1 and \"HEART\"=(select max(HEART) from \"first_board\" where \"CATEGORY\" like 'kor') and \"CATEGORY\" like 'kor'";
		
		
		
		ArrayList<BoardVO> lsbestkor = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lsbestkor.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lsbestkor;
	}
	
	public List<BoardVO> selectbestcafe(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where ROWNUM <= 1 and \"HEART\"=(select max(HEART) from \"first_board\" where \"CATEGORY\" like 'cafe') and \"CATEGORY\" like 'cafe'";
		
		
		
		ArrayList<BoardVO> lsbestcafe = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lsbestcafe.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lsbestcafe;
	}

	public List<BoardVO> selectbestchi(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where ROWNUM <= 1 and \"HEART\"=(select max(HEART) from \"first_board\" where \"CATEGORY\" like 'chi') and \"CATEGORY\" like 'chi'";
		
		
		
		ArrayList<BoardVO> lsbestchi = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lsbestchi.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lsbestchi;
	}
	
	public List<BoardVO> selectbestjap(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where ROWNUM <= 1 and \"HEART\"=(select max(HEART) from \"first_board\" where \"CATEGORY\" like 'jap') and \"CATEGORY\" like 'jap'";
		
		
		
		ArrayList<BoardVO> lsbestjap = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lsbestjap.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lsbestjap;
	}
	
	public List<BoardVO> selectbesteng(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select \"num\",\"title\",\"writer\",\"content\",\"regdate\",\"cnt\",\"IMG\",\"HEART\",\"CATEGORY\" from \"first_board\" where ROWNUM <= 1 and \"HEART\"=(select max(HEART) from \"first_board\" where \"CATEGORY\" like 'eng') and \"CATEGORY\" like 'eng'";
		
		
		
		ArrayList<BoardVO> lsbesteng = new ArrayList<BoardVO>();
		try {
			con = ju.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getDate(5),
				rs.getInt(6),
				rs.getString(7),
				rs.getInt(8),
				rs.getString(9)
						);
				lsbesteng.add(vo);
			}
		}catch(SQLException e) {
	e.printStackTrace();
}finally{
	
	if(con != null) {
		try {
		con.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(stmt != null) {
		try {
		stmt.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if(rs != null) {
		try {
		rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
		return lsbesteng;
	}
	
}
