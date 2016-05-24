.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$1;
.super Ljava/lang/Object;
.source "AdobeImageViewVignette.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setupRipple()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    .prologue
    .line 345
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 348
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->invalidate()V

    .line 349
    return-void
.end method
