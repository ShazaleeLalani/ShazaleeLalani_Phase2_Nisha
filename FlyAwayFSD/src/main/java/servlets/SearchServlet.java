package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.*;
import javax.servlet.http.*;
import model.Search;

public class SearchServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    public void service (HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Search.Date = req.getParameter("Date");
        Search.Source = req.getParameter("Source");
        Search.Destination = req.getParameter("Destination");
        Search.Persons = Integer.parseInt(req.getParameter("Persons"));

        if (Search.Date.equals("")) {
            PrintWriter out = resp.getWriter();
            out.println("Please enter a valid date");
        }
        else {
            Search.Day = getDay(Search.Date);
            resp.sendRedirect("SearchResults.jsp");
        }
    }

    public String getDay(String dateInp) {
        LocalDate dt = LocalDate.parse(dateInp);
        return dt.getDayOfWeek().toString();
    }
}