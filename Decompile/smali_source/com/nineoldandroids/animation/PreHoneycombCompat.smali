.class final Lcom/nineoldandroids/animation/PreHoneycombCompat;
.super Ljava/lang/Object;
.source "PreHoneycombCompat.java"


# static fields
.field static ALPHA:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static PIVOT_X:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static PIVOT_Y:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static ROTATION:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static ROTATION_X:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static ROTATION_Y:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static SCALE_X:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static SCALE_Y:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static SCROLL_X:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static SCROLL_Y:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field static TRANSLATION_X:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static TRANSLATION_Y:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static X:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field static Y:Lcom/nineoldandroids/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nineoldandroids/util/Property",
            "<",
            "Landroid/view/View;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 10
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$1;

    const-string v1, "alpha"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$1;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->ALPHA:Lcom/nineoldandroids/util/Property;

    .line 21
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$2;

    const-string v1, "pivotX"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$2;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->PIVOT_X:Lcom/nineoldandroids/util/Property;

    .line 32
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$3;

    const-string v1, "pivotY"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$3;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->PIVOT_Y:Lcom/nineoldandroids/util/Property;

    .line 43
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$4;

    const-string v1, "translationX"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$4;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->TRANSLATION_X:Lcom/nineoldandroids/util/Property;

    .line 54
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$5;

    const-string v1, "translationY"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$5;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->TRANSLATION_Y:Lcom/nineoldandroids/util/Property;

    .line 65
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$6;

    const-string v1, "rotation"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$6;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->ROTATION:Lcom/nineoldandroids/util/Property;

    .line 76
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$7;

    const-string v1, "rotationX"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$7;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->ROTATION_X:Lcom/nineoldandroids/util/Property;

    .line 87
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$8;

    const-string v1, "rotationY"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$8;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->ROTATION_Y:Lcom/nineoldandroids/util/Property;

    .line 98
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$9;

    const-string v1, "scaleX"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->SCALE_X:Lcom/nineoldandroids/util/Property;

    .line 109
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$10;

    const-string v1, "scaleY"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$10;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->SCALE_Y:Lcom/nineoldandroids/util/Property;

    .line 120
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$11;

    const-string v1, "scrollX"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$11;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->SCROLL_X:Lcom/nineoldandroids/util/Property;

    .line 131
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$12;

    const-string v1, "scrollY"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$12;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->SCROLL_Y:Lcom/nineoldandroids/util/Property;

    .line 142
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$13;

    const-string v1, "x"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$13;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->X:Lcom/nineoldandroids/util/Property;

    .line 153
    new-instance v0, Lcom/nineoldandroids/animation/PreHoneycombCompat$14;

    const-string v1, "y"

    invoke-direct {v0, v1}, Lcom/nineoldandroids/animation/PreHoneycombCompat$14;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/nineoldandroids/animation/PreHoneycombCompat;->Y:Lcom/nineoldandroids/util/Property;

    return-void
.end method
