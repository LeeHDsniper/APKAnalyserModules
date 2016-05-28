.class Lcom/google/android/gms/internal/zzoa$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzoa;->zzb(Lcom/google/android/gms/internal/zzob;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/google/android/gms/internal/zzod;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic zzaHP:Lcom/google/android/gms/internal/zzoa;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzoa;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzoa$1;->zzaHP:Lcom/google/android/gms/internal/zzoa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    check-cast p1, Lcom/google/android/gms/internal/zzod;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/google/android/gms/internal/zzod;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/zzoa$1;->zza(Lcom/google/android/gms/internal/zzod;Lcom/google/android/gms/internal/zzod;)I

    move-result v0

    return v0
.end method

.method public zza(Lcom/google/android/gms/internal/zzod;Lcom/google/android/gms/internal/zzod;)I
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
