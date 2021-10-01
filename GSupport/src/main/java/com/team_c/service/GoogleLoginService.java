package com.team_c.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service("googleLoginService")
public class GoogleLoginService {
	private static final String GOOGLE_CLIENT_ID = "883272106142-4gqb73kjc3q4c1gbr34na98dp4usff37.apps.googleusercontent.com";
	private static final String GOOGLE_CLIENT_SECRET = "nJC0EVVogBKactagnw0dpAgW";
	private static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/GSupport/googleCallBack.do";

	public static JsonNode getAccessToken(String autorize_code) {

		final String RequestUrl = "https://www.googleapis.com/oauth2/v4/token";

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", GOOGLE_CLIENT_ID));
		postParams.add(new BasicNameValuePair("client_secret", GOOGLE_CLIENT_SECRET));
		postParams.add(new BasicNameValuePair("redirect_uri", GOOGLE_REDIRECT_URI)); // 리다이렉트
																												// URI
		postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값

		final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        JsonNode returnNode = null;

		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = ((org.apache.http.HttpResponse) response).getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Post parameters : " + postParams);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}

		return returnNode;

	}

	public static JsonNode getGoogleUserInfo(String autorize_code) {

		final String RequestUrl = "https://www.googleapis.com/oauth2/v2/userinfo";

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpGet get = new HttpGet(RequestUrl);

		JsonNode returnNode = null;

		// add header
		get.addHeader("Authorization", "Bearer " + autorize_code);

		try {
			final HttpResponse response = (HttpResponse) client.execute(get);
			final int responseCode = ((org.apache.http.HttpResponse) response).getStatusLine().getStatusCode();

			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

			System.out.println("\nSending 'GET' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;

	}

}