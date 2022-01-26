package com.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity(name="notetaker")
@Table(name="notetaker")

public class Note {
	@Id
	@Column(name="id")
	private int id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="content")
	private String content;
		
	@Column(name="username")
	private String username;
	
	@Column(name="password")
	private String password;

	@Column(name="name")
	private String name;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Note(int id, String title, String content,String username) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.username = username;
	}

	public Note(int id,String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}

	public Note() {
		super();
	}
	
}
