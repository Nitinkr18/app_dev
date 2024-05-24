# Cat Dog Classifier Flutter App

This repository contains the source code for a Flutter mobile application that utilizes a machine learning model deployed on Google Cloud Platform (GCP) to classify images as either cats or dogs. The ML model is accessed through the following GCP endpoint:

[Cat Dog Classifier ML Model on GCP](https://cat-dog-classifier-using-flask-xisi3zlsna-el.a.run.app/upload)

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

## Docker Hub

The ML model used in this app is containerized using Docker and hosted on Docker Hub. You can find the Docker project repository on the following link:

[GitHub - ML Flask Hugging Face](https://github.com/Nitinkr18/ML-Flask-Hugging_Face.git)
[Docker Link](https://hub.docker.com/repository/docker/nitinkr18/ml-cat-dog-classifier-flask-1/general)


To pull the Docker image, use the following command:

```bash
docker pull nitinkr18/ml-cat-dog-classifier-flask-1:latest
```

## Usage

GCP hosted Link
```bash
https://cat-dog-classifier-using-flask-xisi3zlsna-el.a.run.app/upload
```
Alternatively, you can run the Flutter app locally as described in the "Getting Started" section.

## Contributing

Contributions are welcome! Feel free to open issues or pull requests for any improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

Special thanks to the Google Cloud Platform team for providing the infrastructure for hosting the ML model and to the Flask community for the Flask framework.



## Demo Video

https://github.com/Nitinkr18/app_dev/assets/111683813/381f3481-625e-406b-99d8-d50de414d0f5


