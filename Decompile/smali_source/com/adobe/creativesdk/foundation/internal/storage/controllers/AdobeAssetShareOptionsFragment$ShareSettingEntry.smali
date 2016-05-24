.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;
.super Ljava/lang/Object;
.source "AdobeAssetShareOptionsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ShareSettingEntry"
.end annotation


# instance fields
.field public appName:Ljava/lang/CharSequence;

.field public icon:Landroid/graphics/drawable/Drawable;

.field public packageName:Ljava/lang/String;

.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/String;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "appName"    # Ljava/lang/CharSequence;
    .param p4, "packageName"    # Ljava/lang/String;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 234
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;->icon:Landroid/graphics/drawable/Drawable;

    .line 235
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;->packageName:Ljava/lang/String;

    .line 236
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetShareOptionsFragment$ShareSettingEntry;->appName:Ljava/lang/CharSequence;

    .line 237
    return-void
.end method
