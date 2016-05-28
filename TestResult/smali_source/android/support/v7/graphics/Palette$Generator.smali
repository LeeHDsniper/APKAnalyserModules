.class abstract Landroid/support/v7/graphics/Palette$Generator;
.super Ljava/lang/Object;
.source "Palette.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/Palette;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Generator"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 582
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract generate(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;)V"
        }
    .end annotation
.end method

.method public getVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;
    .registers 2

    .prologue
    .line 597
    const/4 v0, 0x0

    return-object v0
.end method
