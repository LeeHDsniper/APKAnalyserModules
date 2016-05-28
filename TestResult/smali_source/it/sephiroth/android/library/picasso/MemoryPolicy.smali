.class public final enum Lit/sephiroth/android/library/picasso/MemoryPolicy;
.super Ljava/lang/Enum;
.source "MemoryPolicy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lit/sephiroth/android/library/picasso/MemoryPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lit/sephiroth/android/library/picasso/MemoryPolicy;

.field public static final enum NO_CACHE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

.field public static final enum NO_STORE:Lit/sephiroth/android/library/picasso/MemoryPolicy;


# instance fields
.field final index:I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 23
    new-instance v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;

    const-string v1, "NO_CACHE"

    invoke-direct {v0, v1, v3, v2}, Lit/sephiroth/android/library/picasso/MemoryPolicy;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->NO_CACHE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

    .line 28
    new-instance v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;

    const-string v1, "NO_STORE"

    invoke-direct {v0, v1, v2, v4}, Lit/sephiroth/android/library/picasso/MemoryPolicy;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->NO_STORE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

    .line 19
    new-array v0, v4, [Lit/sephiroth/android/library/picasso/MemoryPolicy;

    sget-object v1, Lit/sephiroth/android/library/picasso/MemoryPolicy;->NO_CACHE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

    aput-object v1, v0, v3

    sget-object v1, Lit/sephiroth/android/library/picasso/MemoryPolicy;->NO_STORE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

    aput-object v1, v0, v2

    sput-object v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->$VALUES:[Lit/sephiroth/android/library/picasso/MemoryPolicy;

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
    .line 40
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 41
    iput p3, p0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->index:I

    .line 42
    return-void
.end method

.method static shouldReadFromMemoryCache(I)Z
    .registers 2
    .param p0, "memoryPolicy"    # I

    .prologue
    .line 31
    sget-object v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->NO_CACHE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

    iget v0, v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->index:I

    and-int/2addr v0, p0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method static shouldWriteToMemoryCache(I)Z
    .registers 2
    .param p0, "memoryPolicy"    # I

    .prologue
    .line 35
    sget-object v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->NO_STORE:Lit/sephiroth/android/library/picasso/MemoryPolicy;

    iget v0, v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->index:I

    and-int/2addr v0, p0

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public static valueOf(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/MemoryPolicy;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;

    return-object v0
.end method

.method public static values()[Lit/sephiroth/android/library/picasso/MemoryPolicy;
    .registers 1

    .prologue
    .line 19
    sget-object v0, Lit/sephiroth/android/library/picasso/MemoryPolicy;->$VALUES:[Lit/sephiroth/android/library/picasso/MemoryPolicy;

    invoke-virtual {v0}, [Lit/sephiroth/android/library/picasso/MemoryPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lit/sephiroth/android/library/picasso/MemoryPolicy;

    return-object v0
.end method
