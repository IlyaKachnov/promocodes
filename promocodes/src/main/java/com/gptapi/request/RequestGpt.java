
package com.gptapi.request;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "model",
    "messages",
    "temperature",
    "top_p",
    "n",
    "stream",
    "max_tokens",
    "repetition_penalty"
})
@Generated("jsonschema2pojo")
public class RequestGpt {

    @JsonProperty("model")
    private String model;
    @JsonProperty("messages")
    private List<Message> messages = new ArrayList<Message>();
    @JsonProperty("temperature")
    private Double temperature;
    @JsonProperty("top_p")
    private Double topP;
    @JsonProperty("n")
    private Integer n;
    @JsonProperty("stream")
    private Boolean stream;
    @JsonProperty("max_tokens")
    private Integer maxTokens;
    @JsonProperty("repetition_penalty")
    private Integer repetitionPenalty;

    @JsonProperty("model")
    public String getModel() {
        return model;
    }

    @JsonProperty("model")
    public void setModel(String model) {
        this.model = model;
    }

    @JsonProperty("messages")
    public List<Message> getMessages() {
        return messages;
    }

    @JsonProperty("messages")
    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    @JsonProperty("temperature")
    public Double getTemperature() {
        return temperature;
    }

    @JsonProperty("temperature")
    public void setTemperature(Double temperature) {
        this.temperature = temperature;
    }

    @JsonProperty("top_p")
    public Double getTopP() {
        return topP;
    }

    @JsonProperty("top_p")
    public void setTopP(Double topP) {
        this.topP = topP;
    }

    @JsonProperty("n")
    public Integer getN() {
        return n;
    }

    @JsonProperty("n")
    public void setN(Integer n) {
        this.n = n;
    }

    @JsonProperty("stream")
    public Boolean getStream() {
        return stream;
    }

    @JsonProperty("stream")
    public void setStream(Boolean stream) {
        this.stream = stream;
    }

    @JsonProperty("max_tokens")
    public Integer getMaxTokens() {
        return maxTokens;
    }

    @JsonProperty("max_tokens")
    public void setMaxTokens(Integer maxTokens) {
        this.maxTokens = maxTokens;
    }

    @JsonProperty("repetition_penalty")
    public Integer getRepetitionPenalty() {
        return repetitionPenalty;
    }

    @JsonProperty("repetition_penalty")
    public void setRepetitionPenalty(Integer repetitionPenalty) {
        this.repetitionPenalty = repetitionPenalty;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(RequestGpt.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("model");
        sb.append('=');
        sb.append(((this.model == null)?"<null>":this.model));
        sb.append(',');
        sb.append("messages");
        sb.append('=');
        sb.append(((this.messages == null)?"<null>":this.messages));
        sb.append(',');
        sb.append("temperature");
        sb.append('=');
        sb.append(((this.temperature == null)?"<null>":this.temperature));
        sb.append(',');
        sb.append("topP");
        sb.append('=');
        sb.append(((this.topP == null)?"<null>":this.topP));
        sb.append(',');
        sb.append("n");
        sb.append('=');
        sb.append(((this.n == null)?"<null>":this.n));
        sb.append(',');
        sb.append("stream");
        sb.append('=');
        sb.append(((this.stream == null)?"<null>":this.stream));
        sb.append(',');
        sb.append("maxTokens");
        sb.append('=');
        sb.append(((this.maxTokens == null)?"<null>":this.maxTokens));
        sb.append(',');
        sb.append("repetitionPenalty");
        sb.append('=');
        sb.append(((this.repetitionPenalty == null)?"<null>":this.repetitionPenalty));
        sb.append(',');
        if (sb.charAt((sb.length()- 1)) == ',') {
            sb.setCharAt((sb.length()- 1), ']');
        } else {
            sb.append(']');
        }
        return sb.toString();
    }

    @Override
    public int hashCode() {
        int result = 1;
        result = ((result* 31)+((this.stream == null)? 0 :this.stream.hashCode()));
        result = ((result* 31)+((this.temperature == null)? 0 :this.temperature.hashCode()));
        result = ((result* 31)+((this.maxTokens == null)? 0 :this.maxTokens.hashCode()));
        result = ((result* 31)+((this.messages == null)? 0 :this.messages.hashCode()));
        result = ((result* 31)+((this.repetitionPenalty == null)? 0 :this.repetitionPenalty.hashCode()));
        result = ((result* 31)+((this.model == null)? 0 :this.model.hashCode()));
        result = ((result* 31)+((this.topP == null)? 0 :this.topP.hashCode()));
        result = ((result* 31)+((this.n == null)? 0 :this.n.hashCode()));
        return result;
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if ((other instanceof RequestGpt) == false) {
            return false;
        }
        RequestGpt rhs = ((RequestGpt) other);
        return (((((((((this.stream == rhs.stream)||((this.stream!= null)&&this.stream.equals(rhs.stream)))&&((this.temperature == rhs.temperature)||((this.temperature!= null)&&this.temperature.equals(rhs.temperature))))&&((this.maxTokens == rhs.maxTokens)||((this.maxTokens!= null)&&this.maxTokens.equals(rhs.maxTokens))))&&((this.messages == rhs.messages)||((this.messages!= null)&&this.messages.equals(rhs.messages))))&&((this.repetitionPenalty == rhs.repetitionPenalty)||((this.repetitionPenalty!= null)&&this.repetitionPenalty.equals(rhs.repetitionPenalty))))&&((this.model == rhs.model)||((this.model!= null)&&this.model.equals(rhs.model))))&&((this.topP == rhs.topP)||((this.topP!= null)&&this.topP.equals(rhs.topP))))&&((this.n == rhs.n)||((this.n!= null)&&this.n.equals(rhs.n))));
    }

}
