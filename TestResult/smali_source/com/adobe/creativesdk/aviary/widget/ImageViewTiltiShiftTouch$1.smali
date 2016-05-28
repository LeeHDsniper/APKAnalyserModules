.class Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$1;
.super Ljava/lang/Object;
.source "ImageViewTiltiShiftTouch.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    .prologue
    .line 182
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 185
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->invalidate()V

    .line 186
    return-void
.end method
