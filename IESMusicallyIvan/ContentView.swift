//
//  ContentView.swift
//  IESMusicallyIvan
//
//  Created by m1 on 19/1/26.
//

import SwiftUI

// MARK: - Tarjeta Liquid Glass
struct GlassCard: View {
    let icon: String
    let title: String
    let subtitle: String

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(.cyan)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .opacity(0.7)
            }

            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

// MARK: - Sección
struct SectionView<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(.title2.bold())
            content
        }
    }
}

// MARK: - Vista Principal
struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    
                    Text("IES MusicallyIvan")
                        .font(.largeTitle.bold())
                        .padding(.top, 30)
                    
                    SectionView(title: "🌐 Webs con Login") {
                        
                        NavigationLink {
                            SafariWebView(url: URL(string: "http://www.iesmusicallyivan.es.mialias.net/")!)
                        } label: {
                            GlassCard(
                                icon: "lock.fill",
                                title: "Web Principal",
                                subtitle: "Acceso con credenciales"
                            )
                        }
                        
                        NavigationLink {
                            SafariWebView(url: URL(string: "http://www.iesmusicallyivan.shop.mialias.net/")!)
                        } label: {
                            GlassCard(
                                icon: "cart.fill",
                                title: "Tienda Online",
                                subtitle: "Acceso privado"
                            )
                        }
                        
                        NavigationLink {
                            SafariWebView(url: URL(string: "http://www.iesmusicallyivan.es.mialias.net/moodle")!)
                        } label: {
                            GlassCard(
                                icon: "graduationcap.fill",
                                title: "Moodle",
                                subtitle: "Plataforma educativa"
                            )
                        }
                    }
                    
                    SectionView(title: "🌐 Webs sin Login") {
                        
                        NavigationLink {
                            WebView(url: URL(string: "https://github.com/iesmusicallyivan")!)
                        } label: {
                            GlassCard(
                                icon: "lock.fill",
                                title: "GitHub",
                                subtitle: "Acceso a mis repositorios"
                            )
                        }
                    }
                }
            }
        }
    }
}
