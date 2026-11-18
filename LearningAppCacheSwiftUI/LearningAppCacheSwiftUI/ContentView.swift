import SwiftUI
import Playgrounds

struct ContentView: View {

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    welcomeSection

                    progressSection

                    modulesSection
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("CacheLab")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private var welcomeSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Master iOS Caching")
                .font(.title2.bold())

            Text("Learn NSCache and URLCache through interactive experiments.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var progressSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Your Learning Progress")
                    .font(.headline)

                Spacer()

                Text("0 / 5")
                    .font(.subheadline.bold())
                    .foregroundStyle(.blue)
            }

            ProgressView(value: 0, total: 5)
                .tint(.blue)

            Text("Start your first module to begin learning.")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Learning Modules")
                .font(.title3.bold())

            ForEach(LearningModule.all) { module in
                NavigationLink {
                    ModuleDetailView(module: module)
                } label: {
                    moduleRow(module)
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func moduleRow(_ module: LearningModule) -> some View {
        HStack(spacing: 16) {
            Image(systemName: module.systemImage)
                .font(.title2)
                .foregroundStyle(.blue)
                .frame(width: 48, height: 48)
                .background(Color.blue.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 5) {
                Text(module.title)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(module.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Text(module.duration)
                    .font(.caption2)
                    .foregroundStyle(.blue)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption.bold())
                .foregroundStyle(.tertiary)
        }
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ContentView()
}


#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
