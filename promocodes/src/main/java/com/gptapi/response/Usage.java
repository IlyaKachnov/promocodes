
package com.gptapi.response;

import javax.annotation.processing.Generated;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "prompt_tokens",
    "completion_tokens",
    "total_tokens"
})
@Generated("jsonschema2pojo")
public class Usage {

    @JsonProperty("prompt_tokens")
    private Integer promptTokens;
    @JsonProperty("completion_tokens")
    private Integer completionTokens;
    @JsonProperty("total_tokens")
    private Integer totalTokens;

    @JsonProperty("prompt_tokens")
    public Integer getPromptTokens() {
        return promptTokens;
    }

    @JsonProperty("prompt_tokens")
    public void setPromptTokens(Integer promptTokens) {
        this.promptTokens = promptTokens;
    }

    @JsonProperty("completion_tokens")
    public Integer getCompletionTokens() {
        return completionTokens;
    }

    @JsonProperty("completion_tokens")
    public void setCompletionTokens(Integer completionTokens) {
        this.completionTokens = completionTokens;
    }

    @JsonProperty("total_tokens")
    public Integer getTotalTokens() {
        return totalTokens;
    }

    @JsonProperty("total_tokens")
    public void setTotalTokens(Integer totalTokens) {
        this.totalTokens = totalTokens;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Usage.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("promptTokens");
        sb.append('=');
        sb.append(((this.promptTokens == null)?"<null>":this.promptTokens));
        sb.append(',');
        sb.append("completionTokens");
        sb.append('=');
        sb.append(((this.completionTokens == null)?"<null>":this.completionTokens));
        sb.append(',');
        sb.append("totalTokens");
        sb.append('=');
        sb.append(((this.totalTokens == null)?"<null>":this.totalTokens));
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
        result = ((result* 31)+((this.promptTokens == null)? 0 :this.promptTokens.hashCode()));
        result = ((result* 31)+((this.totalTokens == null)? 0 :this.totalTokens.hashCode()));
        result = ((result* 31)+((this.completionTokens == null)? 0 :this.completionTokens.hashCode()));
        return result;
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if ((other instanceof Usage) == false) {
            return false;
        }
        Usage rhs = ((Usage) other);
        return ((((this.promptTokens == rhs.promptTokens)||((this.promptTokens!= null)&&this.promptTokens.equals(rhs.promptTokens)))&&((this.totalTokens == rhs.totalTokens)||((this.totalTokens!= null)&&this.totalTokens.equals(rhs.totalTokens))))&&((this.completionTokens == rhs.completionTokens)||((this.completionTokens!= null)&&this.completionTokens.equals(rhs.completionTokens))));
    }

}
