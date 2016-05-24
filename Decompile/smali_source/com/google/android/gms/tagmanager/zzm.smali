.class Lcom/google/android/gms/tagmanager/zzm;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/tagmanager/zzm$zza;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final zzaOQ:Lcom/google/android/gms/tagmanager/zzm$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/zzm$zza",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/tagmanager/zzm$1;

    invoke-direct {v0, p0}, Lcom/google/android/gms/tagmanager/zzm$1;-><init>(Lcom/google/android/gms/tagmanager/zzm;)V

    iput-object v0, p0, Lcom/google/android/gms/tagmanager/zzm;->zzaOQ:Lcom/google/android/gms/tagmanager/zzm$zza;

    return-void
.end method


# virtual methods
.method public zza(ILcom/google/android/gms/tagmanager/zzm$zza;)Lcom/google/android/gms/tagmanager/zzl;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/android/gms/tagmanager/zzm$zza",
            "<TK;TV;>;)",
            "Lcom/google/android/gms/tagmanager/zzl",
            "<TK;TV;>;"
        }
    .end annotation

    if-gtz p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxSize <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    invoke-virtual {p0}, Lcom/google/android/gms/tagmanager/zzm;->zzzz()I

    move-result v0

    const/16 v1, 0xc

    if-ge v0, v1, :cond_18

    new-instance v0, Lcom/google/android/gms/tagmanager/zzcw;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/tagmanager/zzcw;-><init>(ILcom/google/android/gms/tagmanager/zzm$zza;)V

    :goto_17
    return-object v0

    :cond_18
    new-instance v0, Lcom/google/android/gms/tagmanager/zzba;

    invoke-direct {v0, p1, p2}, Lcom/google/android/gms/tagmanager/zzba;-><init>(ILcom/google/android/gms/tagmanager/zzm$zza;)V

    goto :goto_17
.end method

.method zzzz()I
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    return v0
.end method
