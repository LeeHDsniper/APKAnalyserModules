.class Lcom/adobe/creativesdk/aviary/panels/FocusPanel$1;
.super Ljava/lang/Object;
.source "FocusPanel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 214
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v0, v1, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    .line 216
    .local v0, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mTiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    if-ne v1, v2, :cond_1e

    .line 217
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mCircleButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$000(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(Z)V

    .line 218
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setTiltShiftDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;)V

    .line 223
    :goto_1d
    return-void

    .line 220
    :cond_1e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mRectButton:Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$100(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageHighlightImageButton;->setChecked(Z)V

    .line 221
    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Linear:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setTiltShiftDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;)V

    goto :goto_1d
.end method
