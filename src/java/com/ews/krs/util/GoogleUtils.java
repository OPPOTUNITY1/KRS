package com.ews.krs.util;

import com.ews.krs.model.UserGoogleDto;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;

public class GoogleUtils {
    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Constant.GOOGLE_CLIENT_ID)
                                .add("client_secret", Constant.GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", Constant.GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", Constant.GOOGLE_GRANT_TYPE)
                                .build()
                ).execute().returnContent().asString();
        JsonObject jsonObj = new Gson().fromJson(response, JsonObject.class);
        return jsonObj.get("access_token").toString().replaceAll("\"", "");
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constant.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, UserGoogleDto.class);
    }
}
