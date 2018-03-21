package br.com.evolucao.servlet;

import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.evolucao.dao.ConnectionFactory;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;

@WebServlet("/aluno/relatorio")
public class RelatorioAlunoServlet extends HttpServlet{

	private static final long serialVersionUID = 5094732240024350118L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) {
		try {
//		String nomeArquivo = request.getServletContext().getRealPath("/relatorio/aluno.jrxml");
//		JasperReport report = JasperCompileManager.compileReport(nomeArquivo);
//		JasperPrint print = JasperFillManager.fillReport(report, null, ConnectionFactory.getConnection());
//		JasperExportManager.exportReportToPdfFile(print, "/home/clauvane/relatorio.pdf");
		
		  String nomeArquivo = request.getServletContext().getRealPath("/relatorio/aluno.jasper");
	      ServletOutputStream ouputStream = response.getOutputStream();
	      response.setContentType("application/pdf;");
	      response.setHeader("Content-disposition", "inline; filename=\"relatorioPorData.pdf\"");
	      JRPdfExporter pdfExporter = new JRPdfExporter();
	      JasperPrint jPrint = JasperFillManager.fillReport(nomeArquivo, null, ConnectionFactory.getConnection());
	      pdfExporter.setParameter(JRExporterParameter.JASPER_PRINT, jPrint);
	      byte[] output = JasperExportManager.exportReportToPdf(jPrint);
	      response.setContentLength(output.length);
	      ouputStream.write(output);
	      
	      ouputStream.flush();
	      ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
