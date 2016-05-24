.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$7;
.super Ljava/lang/Object;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSaveError(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    .prologue
    .line 1426
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$7;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 5
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1429
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$7;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->onSetResult(ILandroid/content/Intent;)V

    .line 1430
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$7;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-static {v0}, Landroid/support/v4/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    .line 1431
    return-void
.end method
