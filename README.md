# ML Cat Dog Classifier Flutter App

This repository contains the source code for a Flutter mobile application that utilizes a machine learning model deployed using Flask and Hugging Face's transformers library to classify images as either cats or dogs. The ML model is containerized using Docker and hosted on Docker Hub.

## Features

- Allows users to select an image from their device's gallery or capture one using the camera.
- Sends the selected image to the ML model for classification.
- Displays the result (cat or dog) along with the confidence score.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/Nitinkr18/ML-Flask-Hugging_Face.git
   ```

2. Install Flutter on your machine by following the [official documentation](https://flutter.dev/docs/get-started/install).

3. Navigate to the `flutter_app` directory:

   ```bash
   cd ML-Flask-Hugging_Face/flutter_app
   ```

4. Install dependencies:

   ```bash
   flutter pub get
   ```

5. Run the app on a connected device or emulator:

   ```bash
   flutter run
   ```

## Docker Image

The ML model used in this app is containerized using Docker and hosted on Docker Hub. You can pull the Docker image from the following link:

[Docker Hub - ML Cat Dog Classifier Flask](https://hub.docker.com/repository/docker/nitinkr18/ml-cat-dog-classifier-flask-1)

To pull the Docker image, use the following command:

```bash
docker pull nitinkr18/ml-cat-dog-classifier-flask-1:latest
```

## Usage

To run the Docker container locally, execute the following command:

```bash
docker run -p 5000:5000 nitinkr18/ml-cat-dog-classifier-flask-1:latest
```

Once the container is running, the ML model will be accessible at `http://localhost:5000`.

## Contributing

Contributions are welcome! Feel free to open issues or pull requests for any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to the [Hugging Face](https://huggingface.co/) team for their excellent transformers library and to the Flask community for the Flask framework.
