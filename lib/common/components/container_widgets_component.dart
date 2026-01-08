import 'package:flutter/material.dart';
import 'package:widget_lab/common/styles/app_text_styles.dart';

class ContainerWidgetsComponent extends StatelessWidget {
  final String titleContainer;
  final String bodyContainer;
  final String urlImage;

  const ContainerWidgetsComponent({
    super.key,
    required this.bodyContainer,
    required this.urlImage,
    required this.titleContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
            height: 165,
            // Añade estos parámetros para forzar recarga
            cacheHeight: null,
            cacheWidth: null,
            // Esta es la clave para evitar el caché
            headers: const {
              'Cache-Control': 'no-cache',
            },
            // Opcional: muestra un error si la imagen no carga
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 165,
                color: Colors.grey[300],
                child: const Icon(Icons.image_not_supported, size: 50),
              );
            },
            // Opcional: muestra un placeholder mientras carga
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                height: 165,
                color: Colors.grey[200],
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleContainer,
                style: AppTextStyles.titleText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                bodyContainer,
                style: AppTextStyles.bodyText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}