
package br.edu.fesa.controller;

import br.edu.fesa.model.Result;
import br.edu.fesa.utils.EnumSignalType;
import com.google.gson.Gson;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "PBLController", urlPatterns = {"/PBLController"})
public class PBLController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Result result = new Result();
        
        try {
            result = getResultParameters(request);
            doCalculus(result);
            
        } catch(Exception ex){
            result = new Result(ex.getMessage());
            
        } finally {  
            String retorno = (new Gson()).toJson(result);
            
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(retorno);
        }
    }
    
    private Result getResultParameters(HttpServletRequest request){
        double frequency = Double.parseDouble(request.getParameter("frequencia"));
        double minFrequency = Double.parseDouble(request.getParameter("frequenciaMin"));
        double maxFrequency = Double.parseDouble(request.getParameter("frequenciaMax"));
        
        int signalTypeValue = Integer.parseInt(request.getParameter("tipoSinal"));
        EnumSignalType signalType = EnumSignalType.forInt(signalTypeValue);
        
        boolean isRealChannel = request.getParameter("canalReal") != null;
        
        return new Result(frequency, minFrequency, maxFrequency, signalType, isRealChannel);
    }
    
    private void doCalculus(Result result){
        
        double frequency = result.getEmitted().getFrequency();
        
        // Emitted
        result.getEmitted().fillAmplitudeList();
        result.getEmitted().fillPhaseList();
        result.getEmitted().fillSignalList();
        
        // Channel
        result.getChannel().fillResponseModule(frequency);
        result.getChannel().fillResponsePhase(frequency);
        
        // Received
        result.getReceived().fillAmplitudeList(result.getChannel());
        result.getReceived().fillPhaseList(result.getChannel());
        result.getReceived().fillSignalList();
        
        // Normalização para exibição
        result.getEmitted().normalizeFrequencyLists();
        result.getChannel().normalizeFrequencyLists();
        result.getReceived().normalizeFrequencyLists();
    }
}
