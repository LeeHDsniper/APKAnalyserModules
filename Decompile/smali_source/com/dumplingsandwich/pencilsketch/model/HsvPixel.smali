.class public Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;
.super Ljava/lang/Object;
.source "HsvPixel.java"


# instance fields
.field public h:F

.field public s:F

.field public v:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput v0, p0, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;->v:F

    iput v0, p0, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;->s:F

    iput v0, p0, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;->h:F

    .line 11
    return-void
.end method

.method public constructor <init>(FFF)V
    .registers 4
    .param p1, "h"    # F
    .param p2, "s"    # F
    .param p3, "v"    # F

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;->h:F

    .line 15
    iput p2, p0, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;->s:F

    .line 16
    iput p3, p0, Lcom/dumplingsandwich/pencilsketch/model/HsvPixel;->v:F

    .line 17
    return-void
.end method
