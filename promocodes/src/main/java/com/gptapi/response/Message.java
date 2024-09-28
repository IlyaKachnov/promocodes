
package com.gptapi.response;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonPropertyOrder({
    "role",
    "content",
    "data_for_context"
})
@Generated("jsonschema2pojo")
public class Message {

    @JsonProperty("role")
    private String role;
    @JsonProperty("content")
    private String content;
    @JsonProperty("data_for_context")
    private List<DataForContext> dataForContext = new ArrayList<DataForContext>();

    @JsonProperty("role")
    public String getRole() {
        return role;
    }

    @JsonProperty("role")
    public void setRole(String role) {
        this.role = role;
    }

    @JsonProperty("content")
    public String getContent() {
        return content;
    }

    @JsonProperty("content")
    public void setContent(String content) {
        this.content = content;
    }

    @JsonProperty("data_for_context")
    public List<DataForContext> getDataForContext() {
        return dataForContext;
    }

    @JsonProperty("data_for_context")
    public void setDataForContext(List<DataForContext> dataForContext) {
        this.dataForContext = dataForContext;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(Message.class.getName()).append('@').append(Integer.toHexString(System.identityHashCode(this))).append('[');
        sb.append("role");
        sb.append('=');
        sb.append(((this.role == null)?"<null>":this.role));
        sb.append(',');
        sb.append("content");
        sb.append('=');
        sb.append(((this.content == null)?"<null>":this.content));
        sb.append(',');
        sb.append("dataForContext");
        sb.append('=');
        sb.append(((this.dataForContext == null)?"<null>":this.dataForContext));
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
        result = ((result* 31)+((this.dataForContext == null)? 0 :this.dataForContext.hashCode()));
        result = ((result* 31)+((this.content == null)? 0 :this.content.hashCode()));
        result = ((result* 31)+((this.role == null)? 0 :this.role.hashCode()));
        return result;
    }

    @Override
    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if ((other instanceof Message) == false) {
            return false;
        }
        Message rhs = ((Message) other);
        return ((((this.dataForContext == rhs.dataForContext)||((this.dataForContext!= null)&&this.dataForContext.equals(rhs.dataForContext)))&&((this.content == rhs.content)||((this.content!= null)&&this.content.equals(rhs.content))))&&((this.role == rhs.role)||((this.role!= null)&&this.role.equals(rhs.role))));
    }

}
