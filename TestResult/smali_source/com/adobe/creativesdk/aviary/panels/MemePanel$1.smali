.class Lcom/adobe/creativesdk/aviary/panels/MemePanel$1;
.super Ljava/lang/Object;
.source "MemePanel.java"

# interfaces
.implements Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/panels/MemePanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/panels/MemePanel;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
    .registers 9
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 116
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    .line 117
    .local v1, "mImageMatrix":Landroid/graphics/Matrix;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v2

    .line 118
    .local v2, "matrixValues":[F
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    const/4 v6, 0x4

    aget v6, v2, v6

    mul-float/2addr v5, v6

    float-to-int v0, v5

    .line 119
    .local v0, "height":I
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel$1;->this$0:Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContentView()Landroid/view/View;

    move-result-object v5

    sget v6, Lcom/aviary/android/feather/sdk/R$id;->foo:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 120
    .local v4, "view":Landroid/view/View;
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 121
    .local v3, "p":Landroid/widget/LinearLayout$LayoutParams;
    add-int/lit8 v5, v0, -0x32

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 122
    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    invoke-virtual {v4}, Landroid/view/View;->requestLayout()V

    .line 124
    return-void
.end method
