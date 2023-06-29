package kh.final_project.xssdefender;

import org.apache.commons.io.IOUtils;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.Map;

public class XSSFilterWrapper extends HttpServletRequestWrapper {
    private byte[] rawData;

    public XSSFilterWrapper(HttpServletRequest request) throws IOException {
        super(request);
        if(request.getMethod().equalsIgnoreCase("post") && (request.getContentType().equals("application/json") || request.getContentType().equals("multipart/form-data"))) {
            InputStream inputStream = request.getInputStream();
            this.rawData = replaceXSS(IOUtils.toByteArray(inputStream));
        }
    }

    //XSS replace
    private byte[] replaceXSS(byte[] data) {
        String byteDataToString = new String(data);
        byteDataToString = translate(byteDataToString);
        return byteDataToString.getBytes();
    }


    private String replaceXSS(String value) {
        if (value != null) {
            value = translate(value);
        }
        return value;
    }

    private static String translate(String targetValue) {
        targetValue = targetValue
                .replaceAll("\\<", "&lt;")
                .replaceAll("\\>", "&gt;")
                .replaceAll("\\(", "&#40;")
                .replaceAll("\\)", "&#41;")
                .replaceAll("\"", "&quot;")
                .replaceAll("\'", "&#039;");
        return targetValue;
    }

    //새로운 인풋스트림을 리턴하지 않으면 에러가 남
    @Override
    public ServletInputStream getInputStream() throws IOException {
        if (this.rawData == null) {
            return super.getInputStream();
        }
        final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.rawData);
        return new ServletInputStream() {
            @Override
            public int read() throws IOException {
                return byteArrayInputStream.read();
            }
        };
    }

    @Override
    public String getQueryString() {
        return replaceXSS(super.getQueryString());
    }

    @Override
    public String getParameter(String name) {
        return replaceXSS(super.getParameter(name));
    }

    @Override
    public Map<String, String[]> getParameterMap() {
        Map<String, String[]> params = super.getParameterMap();
        if (params != null) {
            params.forEach((key, value) -> {
                for (int i = 0; i < value.length; i++) {
                    value[i] = replaceXSS(value[i]);
                }
            });
        }
        return params;
    }

    @Override
    public String[] getParameterValues(String name) {
        String[] params = super.getParameterValues(name);
        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                params[i] = replaceXSS(params[i]);
            }
        }
        return params;
    }

    @Override
    public BufferedReader getReader() throws IOException {
        return new BufferedReader(new InputStreamReader(this.getInputStream(), StandardCharsets.UTF_8));
    }
}
