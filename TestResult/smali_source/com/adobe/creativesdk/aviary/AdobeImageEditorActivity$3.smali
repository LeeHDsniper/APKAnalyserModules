.class Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$3;
.super Ljava/lang/Object;
.source "AdobeImageEditorActivity.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->hideProgressLoader()V
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
    .line 923
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$3;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 932
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity$3;->this$0:Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    # getter for: Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->mInlineProgressLoader:Landroid/view/View;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->access$100(Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 933
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 928
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 925
    return-void
.end method
