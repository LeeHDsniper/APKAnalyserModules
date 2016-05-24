.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$2;
.super Ljava/lang/Object;
.source "AdobeStorageSettingsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;

    const-string v1, "https://accounts.adobe.com"

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->OpenURLinBrowser(Landroid/view/View;Ljava/lang/String;)V
    invoke-static {v0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;->access$000(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeStorageSettingsFragment;Landroid/view/View;Ljava/lang/String;)V

    .line 84
    return-void
.end method
