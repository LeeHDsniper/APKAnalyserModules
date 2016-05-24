.class public final enum Lit/sephiroth/android/library/picasso/NetworkPolicy;
.super Ljava/lang/Enum;
.source "NetworkPolicy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lit/sephiroth/android/library/picasso/NetworkPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lit/sephiroth/android/library/picasso/NetworkPolicy;

.field public static final enum NO_CACHE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

.field public static final enum NO_STORE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

.field public static final enum OFFLINE:Lit/sephiroth/android/library/picasso/NetworkPolicy;


# instance fields
.field final index:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 23
    new-instance v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;

    const-string v1, "NO_CACHE"

    invoke-direct {v0, v1, v5, v3}, Lit/sephiroth/android/library/picasso/NetworkPolicy;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->NO_CACHE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    .line 30
    new-instance v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;

    const-string v1, "NO_STORE"

    invoke-direct {v0, v1, v3, v4}, Lit/sephiroth/android/library/picasso/NetworkPolicy;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->NO_STORE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    .line 33
    new-instance v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;

    const-string v1, "OFFLINE"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v4, v2}, Lit/sephiroth/android/library/picasso/NetworkPolicy;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->OFFLINE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    .line 19
    const/4 v0, 0x3

    new-array v0, v0, [Lit/sephiroth/android/library/picasso/NetworkPolicy;

    sget-object v1, Lit/sephiroth/android/library/picasso/NetworkPolicy;->NO_CACHE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    aput-object v1, v0, v5

    sget-object v1, Lit/sephiroth/android/library/picasso/NetworkPolicy;->NO_STORE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    aput-object v1, v0, v3

    sget-object v1, Lit/sephiroth/android/library/picasso/NetworkPolicy;->OFFLINE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    aput-object v1, v0, v4

    sput-object v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->$VALUES:[Lit/sephiroth/android/library/picasso/NetworkPolicy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 50
    iput p3, p0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->index:I

    .line 51
    return-void
.end method

.method public static isOfflineOnly(I)Z
    .registers 2
    .param p0, "networkPolicy"    # I

    .prologue
    .line 44
    sget-object v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->OFFLINE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    iget v0, v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->index:I

    and-int/2addr v0, p0

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static shouldReadFromDiskCache(I)Z
    .registers 2
    .param p0, "networkPolicy"    # I

    .prologue
    .line 36
    sget-object v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->NO_CACHE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    iget v0, v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->index:I

    and-int/2addr v0, p0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static shouldWriteToDiskCache(I)Z
    .registers 2
    .param p0, "networkPolicy"    # I

    .prologue
    .line 40
    sget-object v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->NO_STORE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    iget v0, v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->index:I

    and-int/2addr v0, p0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static valueOf(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/NetworkPolicy;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;

    return-object v0
.end method

.method public static values()[Lit/sephiroth/android/library/picasso/NetworkPolicy;
    .registers 1

    .prologue
    .line 19
    sget-object v0, Lit/sephiroth/android/library/picasso/NetworkPolicy;->$VALUES:[Lit/sephiroth/android/library/picasso/NetworkPolicy;

    invoke-virtual {v0}, [Lit/sephiroth/android/library/picasso/NetworkPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/picasso/NetworkPolicy;

    return-object v0
.end method
