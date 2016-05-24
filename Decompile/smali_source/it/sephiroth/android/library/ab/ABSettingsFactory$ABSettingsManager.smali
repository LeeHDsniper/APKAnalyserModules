.class abstract Lit/sephiroth/android/library/ab/ABSettingsFactory$ABSettingsManager;
.super Ljava/lang/Object;
.source "ABSettingsFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/ab/ABSettingsFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ABSettingsManager"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected final generateNew()Ljava/util/UUID;
    .registers 2

    .prologue
    .line 19
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public abstract getUUID()Ljava/lang/String;
.end method
