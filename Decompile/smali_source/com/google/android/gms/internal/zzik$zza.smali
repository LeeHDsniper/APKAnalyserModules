.class Lcom/google/android/gms/internal/zzik$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzik;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "zza"
.end annotation


# instance fields
.field public final zzIP:Lcom/google/android/gms/internal/zzij$zzc;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzij$zzc",
            "<TT;>;"
        }
    .end annotation
.end field

.field public final zzIQ:Lcom/google/android/gms/internal/zzij$zza;

.field final synthetic zzIR:Lcom/google/android/gms/internal/zzik;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/zzik;Lcom/google/android/gms/internal/zzij$zzc;Lcom/google/android/gms/internal/zzij$zza;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/zzij$zzc",
            "<TT;>;",
            "Lcom/google/android/gms/internal/zzij$zza;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/google/android/gms/internal/zzik$zza;->zzIR:Lcom/google/android/gms/internal/zzik;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/google/android/gms/internal/zzik$zza;->zzIP:Lcom/google/android/gms/internal/zzij$zzc;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzik$zza;->zzIQ:Lcom/google/android/gms/internal/zzij$zza;

    return-void
.end method
