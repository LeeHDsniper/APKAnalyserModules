.class Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;
.super Ljava/lang/Object;
.source "AdobeAssetFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithTypeForData(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;ILcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "outerClass"
.end annotation


# instance fields
.field handler:Landroid/os/Handler;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 569
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;->this$0:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 570
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile$1outerClass;->handler:Landroid/os/Handler;

    return-void
.end method
