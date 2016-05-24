.class final Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout$1;
.super Landroid/util/Property;
.source "DrawShadowRelativeLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/Property",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 3
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 145
    .local p1, "x0":Ljava/lang/Class;, "Ljava/lang/Class<Ljava/lang/Float;>;"
    invoke-direct {p0, p1, p2}, Landroid/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public get(Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;)Ljava/lang/Float;
    .registers 3
    .param p1, "dsfl"    # Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    .prologue
    .line 148
    # getter for: Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAlpha:F
    invoke-static {p1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->access$000(Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 145
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout$1;->get(Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;)Ljava/lang/Float;

    move-result-object v0

    return-object v0
.end method

.method public set(Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;Ljava/lang/Float;)V
    .registers 4
    .param p1, "dsfl"    # Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;
    .param p2, "value"    # Ljava/lang/Float;

    .prologue
    .line 153
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    # setter for: Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->mAlpha:F
    invoke-static {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;->access$002(Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;F)F

    .line 154
    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 155
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .prologue
    .line 145
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;

    check-cast p2, Ljava/lang/Float;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout$1;->set(Lcom/adobe/creativesdk/foundation/internal/utils/DrawShadowRelativeLayout;Ljava/lang/Float;)V

    return-void
.end method
