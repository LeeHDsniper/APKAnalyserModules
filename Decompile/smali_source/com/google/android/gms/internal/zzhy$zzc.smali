.class Lcom/google/android/gms/internal/zzhy$zzc;
.super Lcom/google/android/gms/internal/zzie;

# interfaces
.implements Lcom/google/android/gms/internal/zzm$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzhy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zzc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/zzie",
        "<TT;>;",
        "Lcom/google/android/gms/internal/zzm$zzb",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic zzIi:Lcom/google/android/gms/internal/zzhy;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/zzhy;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhy$zzc;->zzIi:Lcom/google/android/gms/internal/zzhy;

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzie;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/zzhy;Lcom/google/android/gms/internal/zzhy$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/zzhy$zzc;-><init>(Lcom/google/android/gms/internal/zzhy;)V

    return-void
.end method


# virtual methods
.method public zzb(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzie;->zzf(Ljava/lang/Object;)V

    return-void
.end method
