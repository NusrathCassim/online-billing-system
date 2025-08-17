/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package javaClasses;

public class ReportSummary {
    private String type;
    private String details;

    public ReportSummary(String type, String details) {
        this.type = type;
        this.details = details;
    }

    public String getType() { return type; }
    public String getDetails() { return details; }
}
