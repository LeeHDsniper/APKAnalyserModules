.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$1;
.super Ljava/lang/Object;
.source "AdobeUXAssetOneUpViewerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->action_showCommentsScreen()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;->access$400(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetOneUpViewerActivity;)V

    .line 207
    return-void
.end method
