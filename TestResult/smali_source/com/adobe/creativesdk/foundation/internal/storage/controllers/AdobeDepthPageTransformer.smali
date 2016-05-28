.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDepthPageTransformer;
.super Ljava/lang/Object;
.source "AdobeDepthPageTransformer.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$PageTransformer;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transformPage(Landroid/view/View;F)V
    .registers 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # F

    .prologue
    const/4 v3, 0x0

    const/high16 v5, 0x3f800000

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    .line 16
    .local v0, "pageWidth":I
    const/high16 v2, -0x40800000

    cmpg-float v2, p2, v2

    if-gez v2, :cond_11

    .line 18
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 44
    :goto_10
    return-void

    .line 20
    :cond_11
    cmpg-float v2, p2, v3

    if-gtz v2, :cond_22

    .line 22
    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 23
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 24
    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 25
    invoke-static {p1, v5}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    goto :goto_10

    .line 27
    :cond_22
    cmpg-float v2, p2, v5

    if-gtz v2, :cond_45

    .line 29
    sub-float v2, v5, p2

    invoke-static {p1, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 32
    int-to-float v2, v0

    neg-float v3, p2

    mul-float/2addr v2, v3

    invoke-static {p1, v2}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    .line 35
    const/high16 v2, 0x3f400000

    const/high16 v3, 0x3e800000

    .line 36
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sub-float v4, v5, v4

    mul-float/2addr v3, v4

    add-float v1, v2, v3

    .line 37
    .local v1, "scaleFactor":F
    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setScaleX(Landroid/view/View;F)V

    .line 38
    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setScaleY(Landroid/view/View;F)V

    goto :goto_10

    .line 42
    .end local v1    # "scaleFactor":F
    :cond_45
    invoke-static {p1, v3}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    goto :goto_10
.end method
